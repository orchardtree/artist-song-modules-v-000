require 'pry'

class Artist
  extend Memorable::ClassMethods
  extend Findable::ClassMethods
  
  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize
    @@all << self
    @songs = []
  end
=begin
  def self.find_by_name(name)
    @@artists.detect{|a| a.name == name}
  end
=end
  def self.all
    @@all
  end
=begin
  def self.reset_all
    self.all.clear
  end

  def self.count
    self.all.count
  end
=end
  def add_song(song)
    @songs << song
    song.artist = self
  end

  def add_songs(songs)
    songs.each { |song| add_song(song) }
  end

  def to_param
    name.downcase.gsub(' ', '-')
  end
end
