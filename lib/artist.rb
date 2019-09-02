class Artist
attr_accessor :name

@@all = []

def initialize(name)
    @name = name
    @@all << self
end

 def self.all
    @@all
 end

 def add_song(song)
    song.artist = self
 end

 def songs
    Song.all.select {|song| song.artist == self}
    #Inside the block, you have to return something that 
    #evaluates to true or false, and select will use that 
    #to filter your array.
 end

 def self.find_or_create_by_name(name)
    self.find(name) ? self.find(name) : self.new(name)
  end

  def self.find(name)
    self.all.find {|artist| artist.name == name }
  end

  def save
    @@all << self
  end

  def print_songs
    songs.each {|song| puts song.name}
  end
  #The each method takes two arguments—an element and a block. 
    #The element, contained within the pipes, 
    #is similar to a placeholder
end
