require "pry"

require_relative "artist.rb"
require_relative "mp3_importer.rb"

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

    def self.new_by_filename(filename)
        arr = filename.split(" - ")
        new_song = Song.new(arr[1])
        new_song.artist_name = arr[0]
        new_song
    end

    def artist_name=(name_artist)
        self.artist = Artist.find_or_create_by_name(name_artist)
        artist.add_song(self)
    end


end

