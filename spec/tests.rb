require './wordsearch'
describe "wordsearch" do

	subject { Wordsearch.new(  
		[ ['e','s','a','s','j'],
		  ['w','n','v','o','9'],
		  ['r','s','o','i','a'],
		  ['y','s','s','z','a'],
		  ['e','s','r','a','d'] ]
		) }

	it "can find dzone" do
		x,y, sol = subject.find( 'dzone')
		x.should eql 4 
		y.should eql 4 		 
		sol.should ==	[ ['e',' ',' ',' ',' '],
						  [' ','n',' ',' ',' '],
						  [' ',' ','o',' ',' '],
						  [' ',' ',' ','z',' '],
						  [' ',' ',' ',' ','d'] ]
	end

	it "can find north" do
		subject.north(2,2, 'ova').should be_true
	end

	it "can find north_east" do
		subject.north_east(2,2, 'ooj').should be_true
	end	

	it "can find east" do
		subject.east(2,2, 'oia').should be_true
	end

	it "can find southeast" do
		subject.south_east(0,1, 'wssa').should be_true
		subject.south_east(2,2, 'ozd').should be_true
	end	

	it "can find south" do
		subject.south(2,2,'osr').should be_true
	end

	it "can find southwest" do
		subject.south_west(2,2,'ose').should be_true
	end	


	it "can find west" do
		subject.west(2,2,'osr').should be_true
	end

	it "can find northwest" do
		subject.north_west(2,2,'one').should be_true
	end	

end