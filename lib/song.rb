require_relative "./artist"

class Song

    @@all = []

    attr_accessor :name, :artist

    def initialize(name)
        @name = name

        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        artist_name, song_name = filename.split(" - ")
        song = self.new(song_name)
        song.artist = Artist.find_or_create_by_name(artist_name)
        song
    end

    def artist_name=(artist_name)
        self.artist = Artist.find_or_create_by_name(artist_name)
    end



end