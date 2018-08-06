require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist

  @@songs = [] #will collect all instances of songs created

  def initialize
    @@songs << self
  end

  def self.find_by_name(name) # allows you to call Song.find_by_name("weird fishes") #=> #<weird fishes instance> this instance should aready have its artist att set to radiohead.
    #remember that its the responsibility of the Artist class to create a song and not Song. A song cant create itself, an artist can create it.
    @@songs.detect{|a| a.name == name} #iterates over all the songs and returns the first one with that name.
  end

  def artist=(artist)
    @artist = artist
  end

  def self.reset_all
    @@songs.clear
  end

  def to_param
    name.downcase.gsub(' ', '-')
  end

  def self.count
    self.all.count
  end

  def self.all
    @@songs
  end
end
