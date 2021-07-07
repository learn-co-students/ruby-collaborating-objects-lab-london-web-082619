class MP3Importer
attr_reader :path

def initialize(path)
    @path = path
end

def files
    files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
    #So each just yields and returns the original array, 
    #while collect creates a new array and pushes the results 
    #of the block into it; then it returns this new array.
    #The gsub string method is a substitution method, 
    #much like the old word document find and replace too
    # It finds all instances of the matched 
    #string and replaces it with the new argument. 
  end

  def import
    files.each{|f| Song.new_by_filename(f)}
    #The each method takes two arguments—an element and a block. 
    #The element, contained within the pipes, 
    #is similar to a placeholder
  end

end