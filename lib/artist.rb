require_relative "./song"
require 'pry'

class Artist

    @@all = []

    attr_accessor :name, :song

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.filter{|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(song_name)
        if self.all.any?{|song| song.name == song_name}
            return self.all.find{|song| song.name == song_name}
        end
        Artist.new(song_name)
    end

    def print_songs
        songs.each {|song| puts song.name}
    end


end