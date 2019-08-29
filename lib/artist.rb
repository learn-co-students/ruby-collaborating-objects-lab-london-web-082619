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
        Song.all.select { |song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        new_artist = Artist.all.find { | a | a.name == name } 
        if new_artist.nil?
            Artist.new(name)
        else
            new_artist
        end
    end

    def print_songs
       songs.each { | a | puts a.name }
    end

    # def print_songs
    #     Song.all.select do |song| 
    #         if song.artist == self
    #             puts song.name
    #         end
    #     end
    # end

end
