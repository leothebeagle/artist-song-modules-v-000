require 'pry'

class Artist
  attr_accessor :name
  attr_reader :songs

  @@artists = []

  extend Memorable::ClassMethods
  extend Findable
  include Paramable
  include Memorable::InstanceMethods

  def initialize
    super
    @songs = [] #an artist has many songs and this sets the initial artist's song array. Its empty to begin with
  end

  def self.all
    @@artists
  end

  def add_song(song) #passes in an instance of song as an argument
    @songs << song
    song.artist = self #sets the artist attribute for that song to self
  end

  def add_songs(songs) #passes in an array of song instances then iterates over it and calls add_song (defined above) on each song instance
    songs.each { |song| add_song(song) }
  end

end
