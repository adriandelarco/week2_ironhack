require'rubygems'
require'rspec'
class Lexiconomitron

	def eat_t (string)
		string.gsub!(/[tT]/,'')
	end

	def shazam(array)
		aux_array = []
		array.each do |word|
			aux_array.push(word.reverse.gsub!(/[tT]/,""))
		end
	[aux_array[0],aux_array[-1]]
	end
end

lexi = Lexiconomitron.new
lexi.eat_t('tormento')
lexi.shazam(["This","is","a","boring","test"])