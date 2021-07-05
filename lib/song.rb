class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all()
        @@all
    end

    def self.new_by_filename(file)
        file_without_extension = file.split(".")[0]
        song_data = file_without_extension.split(" - ")
        new_song = Song.new(song_data[1])
        new_song.artist = Artist.find_or_create_by_name(song_data[0])
        new_song
    end

    def artist_name=(name)
        existing_artist = Artist.all.find { |artist| artist.name == name }
        if existing_artist
            self.artist = existing_artist
        else
            self.artist = Artist.new(name)
        end
    end
end