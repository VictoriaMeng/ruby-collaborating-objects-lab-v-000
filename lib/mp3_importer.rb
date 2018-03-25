require 'pry'

class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    files = []
    Dir.foreach(path) do 
      |file| files << file.spl
    end
    
  end

  def import

  end
end

files = MP3Importer.new('./db/mp3s')
files.files
