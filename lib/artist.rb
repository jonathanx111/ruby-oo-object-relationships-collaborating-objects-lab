class Artist
    attr_accessor :name, :artist
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select{|s| s.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        if self.all.map{|x| x.name}.include?(name)
            self.all.find{|a| a.name == name}
        else 
            Artist.new(name)
        end
    end

    def print_songs
        Song.all.each do |s|
            puts s.name if s.artist == self
        end
    end
end