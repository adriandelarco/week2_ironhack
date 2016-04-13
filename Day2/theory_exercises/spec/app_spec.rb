# spec/app_spec.rb
require File.expand_path '../spec_helper.rb', __FILE__

describe 'The Final App' do
  it 'says hello' do
  	get '/hi'
  	expect(last_response.body).to include('Ola')
  end
  it 'says the date' do
  	time_ago = Time.now - 7 * 60 * 60
  	get '/hours/ago/7'
  	expect(last_response.body).to include(time_ago.to_s)
  end
  it 'calculate and says the age' do
  	get '/puertas/jacobo/1997'
  	age = 19.to_s
  	expect(last_response.body).to include(age)
  end
  it 'says if I can pass to the club' do
  	get '/puertas/jacobo/1997'
  	expect(last_response.body).to include("happy.gif")
  end
  it 'says if I cannot pass to the club' do
  	get '/puertas/jacobo/2005'
  	expect(last_response.body).to include("sad.gif")
  end
  it 'says the name' do
  	get '/puertas/kiolowzzzoioopp/1997'	
  	expect(last_response.body).to include("kiolowzzzoioopp")
  end
end