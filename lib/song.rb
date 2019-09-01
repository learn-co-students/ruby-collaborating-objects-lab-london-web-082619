require 'pry'

class Song

    attr_accessor :name, :artist

    @@all = []

    def initialize (name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename (file)
        artist_split = file.split(/ - /)[0]
        new_song = Song.new(file.split(/ - /)[1])
        new_song.artist_name = artist_split
        new_song
    end

    def artist_name= (artist_name)
        @artist = Artist.find_or_create_by_name(artist_name)
    end

end