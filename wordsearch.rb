class Wordsearch

	def initialize( puzzle )
		@puzzle = puzzle
		@x_size = puzzle[0].size
		@y_size = puzzle.size
	end

	def find( word ) 
		(0...@x_size).each do |x|		
			(0...@y_size).each do |y|
				return [x,y,@sol] if north(x,y,word) ||
							   		 north_east(x,y,word) ||
							   		 east(x,y, word) ||
							   		 south_east(x,y,word) ||
							   		 south(x,y, word) ||
							   		 south_west(x,y,word) ||
							   		 west(x,y,word) ||
							   		 north_west(x,y,word)
			end
		end
	end	

	def get_word(x,y, word)
		str = ""
		@sol = []
		(0...@y_size).each do |yy|
			@sol[yy] = []
			(0...@x_size).each do |xx|
				@sol[yy][xx] = ' '
			end
		end

		begin
			str+= @puzzle[y][x]
			@sol[y][x] = @puzzle[y][x]
			return true if word == str
			x,y = yield( x, y )		
		end while ( x < @x_size && y < @y_size && x>=0 && y>=0)
		false
	end	

	def north(x,y,word)
		get_word(x,y, word) { |xx,yy|  [xx, yy-1] }
	end

	def north_east(x,y,word)
		get_word(x,y,word) { |xx,yy|  [xx+1, yy-1] }
	end

	def east(x,y,word)
		get_word(x,y,word) { |xx,yy|  [xx+1, yy] }
	end

	def south_east(x,y,word)
		get_word(x,y,word) { |xx,yy|  [xx+1, yy+1] }
	end

	def south( x,y,word )
		get_word(x,y,word) { |xx,yy|  [xx, yy+1] }
	end

	def south_west(x,y,word)
		get_word(x,y,word) { |xx,yy|  [xx-1, yy+1] }
	end	

	def west(x,y,word)
		get_word(x,y,word) { |xx,yy|  [xx-1, yy] }
	end	

	def north_west(x,y,word)
		get_word(x,y,word) { |xx,yy|  [xx-1, yy-1] }
	end	
end