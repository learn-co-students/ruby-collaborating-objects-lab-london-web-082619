require_relative "./artist"
require_relative "./song"
require 'pry'

class MP3Importer
    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        file_list = Dir.entries(self.path).reject{|file| File.directory?(file)}
    end

    def import
        files.each do | file |
            Song.new_by_filename()
        end
    end
end