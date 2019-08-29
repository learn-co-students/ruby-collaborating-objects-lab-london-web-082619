require 'pry'
class MP3Importer
    attr_reader :path, :library
    @@all = []
    def initialize(path)
        @path = path
        library = []
        @@all << self
    end

    def self.all
        @@all
    end
    
    def files
        # load files from the path folder
        # choose and return mp3 files
        Dir.entries(path).select do |file| 
        file.include?(".mp3")
       end
       
    end

    def import
        # send all files in the path to new_by_filename method in Song class
        self.files.each{|file| Song.new_by_filename(file)} 
    end
end