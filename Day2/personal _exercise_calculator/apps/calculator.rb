class Calculate
	def initialize(number1, number2)
		@number1 = number1.to_f
		@number2 = number2.to_f
	end
	
	def add
		@result = @number1 + @number2
	end

	def substract
		@result = @number1 - @number2
	end

	def multiply
		@result = @number1 * @number2
	end

	def divide
		@result = @number1 / @number2
	end

	def select_operation(operation)
		case operation
			when "add"
				add
			when "substract"
				substract
			when "multiply"
				multiply
			when "divide"
				divide
		end
	end
end