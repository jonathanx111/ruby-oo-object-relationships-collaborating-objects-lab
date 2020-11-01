require 'pry'
class MP3Importer
    attr_accessor :path

    def initialize(path)
       @path = path
    end

    def files
       new = Dir.entries("./spec/fixtures/mp3s")
       new.select{|x| x.include?(".mp3")}
    end

    def import
        self.files.each do |x|
            Song.new_by_filename(x)
        end
    end
end


