require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist

  @@songs = [] #will collect all instances of songs created

  extend Memorable::ClassMethods
  extend Findable
  include Paramable
  include Memorable::InstanceMethods

  def initialize
    self.class.all << self
  end

  def artist=(artist) #why are we specifiying it here and not relying on attr_writer or attr_accessor to write the method for us? isnt it doing the same thing?
    @artist = artist
  end

  def self.all
    @@songs
  end
end
