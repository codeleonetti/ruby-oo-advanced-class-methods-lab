require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initilizer(name, artist_name)
    
      @name = name
      @artist_name = artist_name
      save
  end
  
  def self.create
      song=Song.new
      @@all << song
      return song
  end

  def self.new_by_name(name)
      song=self.new
      song.name = name
      #@@all << song
      return song
  end

  # def self.create_by_name(name)
  #   self.new_by_name(name)

  # end
  def self.create_by_name(name)
    song = self.create
    song.name = name
    return song
  end

  def self.find_by_name(name)
    self.all.find{ | song | song.name == name}
  end
  # def self.find_by_name(name)
  #   @@all.each do |song|
  #     if song.name == name
  #     return song
  #     end
  #   end
  #   return false
  # end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  
  
   end

   def self.alphabetical
    self.all.sort_by(&:name)

   end
    

   def self.new_from_filename(file)
    #binding.pry
    music = file[0..-5].split(" - ")
    song=Song.new
    song.name = music[1]
    song.artist_name = music[0]
    return song
   
   end

   def self.create_from_filename(file)
    music = file[0..-5].split(" - ")
    song=Song.create
    song.name = music[1]
    song.artist_name = music[0]
    return song
 
   end

   def self.destroy_all
    @@all.clear
   end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
