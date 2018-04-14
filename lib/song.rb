require 'byebug'

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
  	new_song = self.new
  	new_song.save
  	new_song
  end

  def self.create_by_name(name)
  	new_song = self.new
  	new_song.name = name
  	new_song.save
  	new_song
  end

  def self.new_by_name(name)
  	new_song = self.new
  	new_song.name = name
  	new_song.save
  	new_song
  end

  def self.find_by_name(name)
  	song = self.all.find{|song| song.name = name}
  	song
  end

  def self.find_or_create_by_name(name)
  	song = self.find_by_name(name)
  	song ||= create_by_name(name)
  end

  def self.alphabetical
  	self.all.sort_by{ |song| song.name }
  end

  def self.new_from_filename(filename)
  	s = filename.split(" - ")
  	artist_name = s[0]
  	song_name = s[1].split(".")[0]
  	new_song = self.create_by_name(song_name)
  	new_song.artist_name = artist_name
  	new_song
  end

  def self.create_from_filename(filename)
  	new_song = self.new_from_filename(filename)
  	new_song.save
  end

  def self.destroy_all
  	@@all = []
  end
end
