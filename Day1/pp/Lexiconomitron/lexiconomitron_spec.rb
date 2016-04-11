require'./lexiconomitron.rb'

describe Lexiconomitron do 
 
  describe "#eat_t" do
    it "removes every letter t from the input" do
      @lexi = Lexiconomitron.new
      expect(@lexi.eat_t("great scott!")).to eq("grea sco!")
    end
  end
  
  describe "#shazam" do
  	before do
  		@shazam = Lexiconomitron.new
  	end
  	it "reverse the words and remove ts" do
  		expect(@shazam.shazam(["This","is","a","boring","test"])).to eq(["sih","se"])
  	end
 end
end