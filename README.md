DZone Wordgrid Kata
===================
Taken from http://java.dzone.com/articles/thursday-code-puzzler-13

Given a wordsearch grid, find a word within the grid.  Use test driven development.

Example
-------
Find the word dzone in the following grid

	[ ['e','s','a','s','j'],
	  ['w','n','v','o','9'],
	  ['r','s','o','i','a'],
	  ['y','s','s','z','a'],
	  ['e','s','r','a','d'] ]

Answer - The word dzone appears going from bottom right to top left as indicated below:

	[ ['e',' ',' ',' ',' '],
	  [' ','n',' ',' ',' '],
	  [' ',' ','o',' ',' '],
	  [' ',' ',' ','z',' '],
	  [' ',' ',' ',' ','d'] ]


My Solution
-----------

Pretty quickly it became apparent that I needed a set of methods, which given a starting grid position, would search for the target word heading in a northerly, north easterly, easterly etc direction.  Watch out for the clever use of a yield block to define how the cursor should move for each of the 'compass' directions ie.


	def north(x,y,word)
		get_word(x,y, word) { |xx,yy|  [xx, yy-1] }
	end

	def north_east(x,y,word)
		get_word(x,y,word) { |xx,yy|  [xx+1, yy-1] }
	end


