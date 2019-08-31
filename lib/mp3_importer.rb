class MP3Importer

    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
       mp3files = Dir.glob("#{path}/*.mp3")
       mp3files.collect {|files|files.gsub("#{path}/","")}
    end
    #firstly you are loading files using Dir.global. ALl of the files that have 
    #.mp3 extension. 
    #next you are enumerating over these and using .gsub string method to
    #remove the file path from the name. I.e. "./spec/fixtures/mp3s/Action Bronson - Larry Csonka - indie.mp3"
    #becomes simply "Action Bronson - Larry Csonka - indie.mp3"


    def import
        files.each {|file|Song.new_by_filename(file)}
    end
    #this method calls on the above files method and enumerates over the collection
    #created by it with .each, takes each file and calls a new instance of Song class
    #for each, with the name argument being the name of each file (as correctly chopped up 
    #from its filepath in the files method above)

end
