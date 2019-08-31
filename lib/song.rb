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
        split_song = filename.split(" - ")
        song_name = split_song[1]
        song_artist = split_song[0]
        new_song = Song.new(song_name)
        new_song.artist_name = song_artist
        new_song
    end
#method first parses the string into artist and name with split and variable assignments to each. Then creates
#a new intsance of a song, new_song, calling on Song.new and passing this instantiated object the name of the song
#that we assigned, via split, to song_name. Then, to be able to assign not just a string of the artist (as split from the 
#string passed into the method), we built the below method, which in turn invokes code from the find_or_create_by_name
#method within the Artist class. Then we could return to the above method, and invoke artist_name and then set that 
#to equal the split artist's name. That invokation took the artist name, searched existing artists for its existence
#adds it if it can find it and creates and adds it if not 

    def artist_name=(artist_name)
        self.artist = Artist.find_or_create_by_name(artist_name)
        self.artist.add_song(self)
    end
end
#this instance method, when called on a specific instance of the Song class, assigns the .artist association to be 
#with the name passed in as argument or creates it if it doesn't already exist. It does this with DRY - it calls
#on the method already written within artist, thus invoking the following code 

        #self.all.find {|artist|artist.name == name} || self.new(name)

#see artist file for reminder of what you are doing here. 