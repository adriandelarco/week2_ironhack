require File.expand_path("../../apps/calculator.rb", __FILE__)

describe 'It should calculate stuff' do

  describe '#add' do
    
    before(:each) do
	  @calc = Calculate.new(2,8)
	end

    it 'should sum two numbers' do
    	expect(@calc.add).to eq(10)
    end

    it 'should substract two numbers' do
    	expect(@calc.substract).to eq(-6)
    end

    it 'should multiply two numbers' do
    	expect(@calc.multiply).to eq(16)
    end

    it 'should divide two numbers' do
    	expect(@calc.divide).to eq(0.25)
    end

    it 'should decide the operation' do
    	expect(@calc.select_operation("add")).to eq(10)
    end

  end

end