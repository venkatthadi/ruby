class Song
	# variables
	@@plays = 0

    def initialize(name, artist, duration)
		@name = name
		@artist = artist
		@duration = duration
		@plays = 0
	end

	#return name of the song
	def name
		@name
	end

	#return artist of the song
	def artist
		@artist
	end

	#return duation of the song
	def duration
		@duration
	end

	def play
		@plays += 1
		@@plays += 1
		"This song: #@plays plays. Total #@@plays plays."
	end

	def to_s
		"Song: #{@name}-#{@artist} (#{@duration})"
	end
end

class KaraokeSong < Song
    def initialize(name, artist, duration, lyrics)
        super(name, artist, duration) # get the result of method from parent class
        @lyrics = lyrics
    end

    def duation=(newDuration)
        @duration = newDuration
    end

    def durationInMinutes
        @duration/60.0
    end

    def durationInMinutes=(durationInMinutes)
        @duration = (durationInMinutes*60).to_i
    end

    def to_s
        super + " [#{@lyrics}]"
    end
end

class SongList
	def initialize
		@songs = Array.new
	end

	# def [](key)
	# 	if key.kind_of?(Integer)
	# 		return @songs[key]
	# 	else
	# 		for i in 0...@songs.length
	# 			return @songs[i] if key == @songs[i].name
	# 		end
	# 	end
	# 	return nil
	# end

	def [](key)
		return @songs[key] if key.kind_of?(Integer)
		return @songs.find { |aSong| aSong.name == key}
	end

	def append(aSong)
		@songs.push(aSong)
		self
	end

	def deleteFirst
		@songs.shift
	end

	def deleteLast
		@songs.pop
	end
end

aSong = KaraokeSong.new("Faded", "Alan Walker", 160, "I'm faded...")
aSong.durationInMinutes=2.5
puts aSong.name
puts aSong.artist
puts aSong.to_s

aSong2 = KaraokeSong.new("Alone", "Alan Walker", 200, "Where are you now...")

puts aSong.play
puts aSong2.play
puts aSong2.play

list = SongList.new
list.append(Song.new("Track1", "Artist1", 1))
list.append(Song.new("Track2", "Artist1", 2))

puts list[1]
puts list["Track1"]
