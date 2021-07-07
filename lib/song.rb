 class Song

    @@all = []
    attr_accessor :name, :artist, :artist_name

    def initialize(name) #Song.new(name)
        @name = name
        @@all << self
        ##artist= sets the artist object to belong to the song (FAILED - 13)
    end

    def self.all #Song.all
        @@all
    end

    def self.new_by_filename(filename) #Song.new_by_filename("Action Bronson - Larry Csonka - indie.mp3")
        song_info = filename.chomp(".mp3").split(" - ")
        song = Song.new(song_info[1])
        song.artist_name = song_info[0]
        song
    end

    def artist_name=(artist_name)
        # accepts an artist's name, finds or creates an Artist instance 
        artist = Artist.find_or_create_by_name(artist_name)
        @artist = artist
        #and assigns it to the Song's artist attribute
    end


end