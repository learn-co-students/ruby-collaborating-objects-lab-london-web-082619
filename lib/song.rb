class Song
attr_accessor :name, :artist
@@all = []

def initialize(name)
    @name = name
    @@all << self
end

def save
 @@all << self
end

def self.all
    @@all
end

def self.new_by_filename(filename)
    artist, song = filename.split(" - ") #I used split method to separet
    #the string
    new_song = self.new(song)
    # here I create a new song instance
    new_song.artist_name = artist
    #I associate that new song witn an artist
    new_song
    #and here will return a new song instance
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end

end