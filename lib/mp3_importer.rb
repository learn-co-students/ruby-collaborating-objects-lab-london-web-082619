require 'pry'

class MP3Importer

    attr_accessor :path

    def initialize (path)
        @path = path
    end

    def files
        list = Dir.entries(self.path).select {|file| !File.directory?(file)}
    end

    def import
        files.each do | file |
            Song.new_by_filename(file)
        end
    end
        

end