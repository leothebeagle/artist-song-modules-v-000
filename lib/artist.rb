require 'pry'

class Artist
  attr_accessor :name
  attr_reader :songs

  @@artists = []

  def self.find_by_name(name) #Artist.find_by_name(radiohead) #=> #<radiohead>
    @@artists.detect{|a| a.name == name}
  end

  def initialize
    @@artists << self
    @songs = [] #an artist has many songs and this sets the initial artist's song array. Its empty to begin with
  end

  def self.all
    @@artists
  end

  def self.reset_all
    self.all.clear #since we are within a class method here, self refers to the class.
  end

  def self.count
    @@artists.count
  end

  def add_song(song) #passes in an instance of song as an argument
    @songs << song
    song.artist = self #sets the artist attribute for that song to self
  end

  def add_songs(songs) #passes in an array of song instances then iterates over it and calls add_song (defined above) on each song instance 
    songs.each { |song| add_song(song) }
  end

  def to_param
    name.downcase.gsub(' ', '-')
  end

end
