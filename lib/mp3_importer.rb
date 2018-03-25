require 'pry'

class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    files = []
    Dir.foreach(path) { |file| files << file if file.include?(".mp3") }
    files
  end

  def import
    files.map! do |file|
      file_array = file.split(%r{ - })
      file_arrray[-1].slice!(".mp3")
      file_arrray
    end 
  
  end
end

files = MP3Importer.new('./db/mp3s')
files.files
