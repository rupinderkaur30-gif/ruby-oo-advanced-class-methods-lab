  require "pry"
  
  class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
def self.create
  song = self.new
  self.all << song
  return song
end
def self.new_by_name(title)
  song = self.new
  song.name = title
  song
end
def self.create_by_name(title)
  song = self.create
  song.name = title
  song
end
def self.find_by_name(title)
  self.all.find{|song| song.name == title}
end
def self.find_or_create_by_name(title)
 if song = self.find_by_name(title)
  song
 else
  song = self.create_by_name(title)
end
end
def self.alphabetical
  self.all.sort_by {|song| song.name}
end
def self.new_from_filename(filename)
  new_song = self.new

  song = filename.split(" - ")
  #binding.pry
  song_name = song[1].gsub(".mp3", "")
 new_song.name = song_name
 song_artist_name = song[0]
 new_song.artist_name = song_artist_name
 new_song
 #binding.pry

 
end
def self.create_from_filename(filename)
  new_song = self.new_from_filename(filename)
  song = self.create
  song.name = new_song.name
  song.artist_name = new_song.artist_name
  new_song
  #binding.pry
  

end
def self.destroy_all
  self.all.clear
end
end
