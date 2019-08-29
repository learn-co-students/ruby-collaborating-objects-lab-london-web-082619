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

    def songs
        Song.all.select{|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        find_or_create_artist = self.all.find{|artist| artist.name == name} || self.new(name)
        find_or_create_artist
    end

    def print_songs
        songs.map{|song_name| puts song_name.name}
    end
end