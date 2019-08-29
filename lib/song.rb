require "pry"
class Song


    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    # example = "Action Bronson - Larry Csonka - indie.mp3"
    

    def self.new_by_filename(file)
        artist, song = file.split(" - ")
        new_song = self.new(song)
        new_song.artist_name = artist
        new_song
    end

    
    def artist_name=(artist)
        self.artist = Artist.find_or_create_by_name(artist)
    end

end

