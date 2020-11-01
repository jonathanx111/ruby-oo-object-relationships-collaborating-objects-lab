require 'pry'
class Song
    attr_accessor :name, :artist
    
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end
    
    def artist_name=(artist_name)
        self.artist = Artist.find_or_create_by_name(artist_name)
        self.artist.add_song(self)
    end

    def self.new_by_filename(file_name)
        new1 = file_name.split(" - ")
        song = Song.new(new1[1])
        song.artist_name = new1[0]
        song
    end
end