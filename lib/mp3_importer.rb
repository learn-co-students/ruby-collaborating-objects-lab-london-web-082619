# Write code which responds to MP3Importer.new('./spec/fixtures').import

# Since we have to send the filenames to the Song class, we'll end up 
# calling the following code in the #import method: Song.new_by_filename(some_filename). 
# This will send us to the Song class, specifically Song.new_by_filename and handle the 
# creation of Song instances and their associated Artist instances.


class MP3Importer

    attr_accessor :path

    def initialize(path) #MP3Importer.new("./spec/fixtures/mp3s")
        @path = path
    end

    def files #mp3importer.files
        path_as_string = "#{@path}/*.mp3"
        files = Dir[path_as_string] #=> returns array of file names including path
        # normalizes the filename to just the mp3 filename with no path
        files = files.map { |filename| filename.split("#{@path}/") } #=> returns ["", "filename"]
        # removes all "" elements from array
        files = files.flatten.reject! { |filename| filename == ""} #=> returns array of normalised file names
        files
    end

    def import #mp3importer.import
        #imports the files into the library by creating songs from a filename
        self.files.each do |filename| 
            Song.new_by_filename(filename)

        end

        # call this: Song.new_by_filename(some_filename)
    end


end