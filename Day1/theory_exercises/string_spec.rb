require './string.rb'

RSpec.describe "string sumator" do


	context "Sum of strings " do
		
		let(:subject) {Strings.new.sum("a","b")}
		
		it "should sum two strings" do
			expect(subject).to eq("ab")
		end

	end	

	context "Sum of numbers" do
		
		let(:subject) {Strings.new.sum(9,7)}
		let(:subject2) {Strings.new.sum(9,"a")}

		it "should sum two numbers into string" do
			expect(subject).to eq(16)
		end

		it "should sum one numbers and one string into string" do
			expect(subject2).to eq("9a")
		end
	end

	subject {Strings}
	it "should sum two arrays into string" do
		expect(subject.new.sum([9],[7,4])).to eq("974")
	end
	it "should sum two nill"  do
		expect(subject.new.sum(nil, nil)).to eq("empty sum")	
	end
	it "should sum two nill"  do
		expect(subject.new.sum(nil, 5)).to eq("5")	
	end
	
end