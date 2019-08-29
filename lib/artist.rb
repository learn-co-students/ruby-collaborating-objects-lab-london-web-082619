class Artist
    @@all = []

    attr_accessor :name

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all()
        @@all
    end

    def add_song(song)
        song.artist = self
    end

    def songs()
        Song.all.select { | song | song.artist == self }
    end

    def self.find_or_create_by_name(name)
        current_artist = Artist.all.find { | artist | artist.name == name }
        current_artist ? (return current_artist) : (return Artist.new(name))
    end

    def print_songs()
        songs().each { | song | puts song.name }
    end

end