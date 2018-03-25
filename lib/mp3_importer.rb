require 'pry'

class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    files = []
    Dir.foreach(path) do |file|
      file_arrray = file.split(%r{ - })
      file_arrray[-1].slice!(".mp3")
      files << file_arrray
    end
    files
  end

  def import

  end
end

files = MP3Importer.new('./db/mp3s')
files.files
