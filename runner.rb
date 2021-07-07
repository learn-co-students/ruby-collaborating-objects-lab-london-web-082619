require 'pry'

require_relative 'lib/artist.rb'
require_relative 'lib/mp3_importer.rb'
require_relative 'lib/song.rb'

kanye = Artist.new("Kanye West")
taylor = Artist.new("Taylor Swift")
lorde = Artist.new("Lorde")

music = MP3Importer.new("./spec/fixtures/mp3s")




binding.pry
'save'

# 