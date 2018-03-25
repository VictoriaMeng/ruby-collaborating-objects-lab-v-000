require 'pry'

class MP3Importer
  attr_accessor :path, :file_names

  def initialize(path)
    @path = path
    @file_names = []
  end

  def files
    Dir.foreach(path) { |file| file_names << file if file.include?(".mp3") }
  end

  def import
    files.each do |file|
      file_array = file.split(%r{ - })
      file_array[-1].slice!(".mp3")
      artist = Artist.find_or_create_by_name(file_array[0])
      artist.add_song(file_array[1])
    end
  end
end

files = MP3Importer.new('./db/mp3s')
files.files
