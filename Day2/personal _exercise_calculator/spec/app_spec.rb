# spec/app_spec.rb
require File.expand_path '../spec_helper.rb', __FILE__

describe 'Calculator app' do

	describe 'Show GUI' do

		context '/add' do
			it 'It should show a button' do
				get '/add'
				expect(last_response.body).to include("add_button")
			end
			it 'It should show first input' do
				get '/add'
				expect(last_response.body).to include("input_number1")
			end
			it 'It should show second input' do
				get '/add'
				expect(last_response.body).to include("input_number2")
			end
		end

		context '/substract' do
			it 'It should show a button' do
				get '/substract'
				expect(last_response.body).to include("substract_button")
			end
			it 'It should show first input' do
				get '/substract'
				expect(last_response.body).to include("input_number1")
			end
			it 'It should show second input' do
				get '/substract'
				expect(last_response.body).to include("input_number2")
			end
		end

		context '/multiply' do
			it 'It should show a button' do
				get '/multiply'
				expect(last_response.body).to include("multiply_button")
			end
			it 'It should show first input' do
				get '/multiply'
				expect(last_response.body).to include("input_number1")
			end
			it 'It should show second input' do
				get '/multiply'
				expect(last_response.body).to include("input_number2")
			end
		end

		context '/divide' do
			it 'It should show a button' do
				get '/divide'
				expect(last_response.body).to include("divide_button")
			end
			it 'It should show first input' do
				get '/divide'
				expect(last_response.body).to include("input_number1")
			end
			it 'It should show second input' do
				get '/divide'
				expect(last_response.body).to include("input_number2")
			end
		end

		context '/' do
			it 'It should show add button' do
				get '/'
				expect(last_response.body).to include("add_button")
			end
			it 'It should show substract button' do
				get '/'
				expect(last_response.body).to include("substract_button")
			end
			it 'It should show multiply button' do
				get '/'
				expect(last_response.body).to include("multiply_button")
			end
			it 'It should show divide button' do
				get '/'
				expect(last_response.body).to include("divide_button")
			end
			it 'It should show first input' do
				get '/'
				expect(last_response.body).to include("input_number1")
			end
			it 'It should show second input' do
				get '/'
				expect(last_response.body).to include("input_number2")
			end
		end

		context '/result' do
			it 'It should show a save button' do
				get '/'
				expect(last_response.body).to include("save_button")
			end
			it 'It should show the result' do
				get '/'
				expect(last_response.body).to include("span")
			end
		end
		
	end
  
end