class Artist

    @@all = []
    attr_accessor :name

    def initialize(name) #Artist.new(name)
        @name = name
        @@all << self
    end

    def self.all #Artist.all
        @@all
    end

    def self.find_or_create_by_name(artist_name) #Artist.find_or_create_by_name(artist_name)
        # always returns an Artist instance
        # finds or creates an artist by name maintaining uniqueness of objects by name property
        # Creates new instance of Artist if none exist
        index = @@all.find_index{ |artist| artist.name == artist_name} 
        index ? (@@all[index]) :  Artist.new(artist_name)
        #return Artist instance
    end

    def songs #artist.songs
        #lists all songs that belong to this artist
        Song.all.select{ |song| song.artist == self}
    end

    def add_song(song) #kanye.add_song(song)
        #keeps track of an artist's songs
        song.artist = self
    end

    def print_songs #artist.print_songs
        self.songs.each {|song| puts song.name}
    end

    
end