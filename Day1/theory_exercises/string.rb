require 'rspec'
require 'rubygems'


class Strings

	def sum(string1, string2)

		string1.class == Array ? string1 = string1.join('') : string1 ;
		string2.class == Array ? string2 = string2.join('') : string2 ;

		if string1.class == Fixnum && string2.class == Fixnum
			string1 + string2
		elsif string1 == nil && string2 == nil
			"empty sum"
		elsif (string1 == nil && string2.class == Fixnum) || (string2 == nil && string1.class == Fixnum) 
			string1.to_s + string2.to_s
		else
			string1.to_s + string2.to_s
		end

	end

end