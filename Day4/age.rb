class Age
	def self.calculate(year)
		year == "" ? 0 : (Time.now.strftime "%Y").to_i - year.to_i;
	end
end