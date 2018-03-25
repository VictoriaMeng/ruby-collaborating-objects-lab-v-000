require 'pry'

class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    files = []
    Dir.foreach(path) do |file|
      if file.include?(".mp3")
        file_array = file.split(%r{ - })
        file_array[-1].slice!(".mp3")
        files << file_array
      end
    end
    files
  end

  def import
    files.each do |file|
      artist = Artist.find_or_create_by_name(file[0])
      artist.add_song(file[1])
    end
  end
end

files = MP3Importer.new('./db/mp3s')
files.files
