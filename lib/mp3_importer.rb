require 'pry'

class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    files = []
    Dir.foreach(path) { |file| files << file }
    file_array = files.split(%r{ - })
    file_array[-1].slice!(".mp3")
  end

  def import

  end
end

files = MP3Importer.new('./db/mp3s')
files.files
