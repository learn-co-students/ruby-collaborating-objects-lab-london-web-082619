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
    #getter method, returns the @@all array.

    def add_song(song)
        song.artist = self 
    end
    #setter method, this sets the passed song's .artist object association to be whatever instance of 
    #artist the method is called on. 

    def songs
        Song.all.select {|songs|songs.artist == self}
    end
    #this method enumerates over the @@all array within the Song class, and uses .select enumerator to 
    #return a new array of only the songs that have .artist equal to self (the artist the method is called on)

    def self.find_or_create_by_name(name)
        self.all.find {|artist|artist.name == name} || self.new(name)
    end
#this is first checking to see if it can find the passed name by enumerating (.find) over the @@all
#array within self (self here is the whole artist class since the method knows to refer to the whole class
#because it has self in the name of the method). If it cannot do that, it does the other side 
#of the double pipes (basically an either or operator in this instance) and creates a new instance of
#self (i,e., a new instance of artist). New instances expect, via initialize, to be passed a name argument
#so we just pass the name argument of this method into the self.new(name).

    def print_songs
        songs.each do |songs|puts songs.name
            end
    end

end
