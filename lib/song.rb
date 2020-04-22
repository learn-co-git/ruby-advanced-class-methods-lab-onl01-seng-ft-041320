class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.create
     song = self.new
     song.save
     return song 
  end
  
  def self.new_by_name(name)
     song = self.new
     song.name = name
     return song
  end 
  
  def self.create_by_name(name)
     song = self.create
     song.name = name
     song.save
     return song

  end
  
    def self.find_by_name(name)
     return self.all.select { |song| song.name == name }[0]
     return self.all.find { |song| song.name == name }
    end
   
     def self.find_or_create_by_name(name)
      return self.find_by_name(name) || self.create_by_name(name)
     end
     
     def self.alphabetical
    return @@all.uniq.sort_by { |song| song.name }
     end
     
     def self.new_from_filename(filename)
      song = self.new
      song.name, song.artist_name = Song.parse_filename(filename)
         return song
     end
     
     def self.create_from_filename(filename)
      song = self.new_from_filename(filename)
      song.save
      return song
     end 
     
       def self.parse_filename(filename)
        parsed_filename = filename.chomp(".mp3").split(" - ")
        artist_name = parsed_filename[0]
        name = parsed_filename[1]
        return name, artist_name
       end
     
       def self.destroy_all
        @@all = []
       end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
