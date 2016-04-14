require File.expand_path '../spec_helper.rb', __FILE__

RSpec.describe 'The Iron web' do
  describe 'get methods' do
    describe 'index' do
      it 'gives status 200' do
        get '/index'
        expect(last_response).to be_ok
      end
      it 'renders index page' do
        get '/index'
        expect(last_response.body.downcase).to include('ironhack')
      end
    end
    describe 'profile' do
      it 'gives status 200' do
        get '/profile'
        expect(last_response).to be_ok
      end
      it 'renders profile page' do
        get '/profile'
        expect(last_response.body.downcase).to include('profile')
      end
    end
    describe '/courses' do
      it 'gives status 200' do
        get '/courses'
        expect(last_response).to be_ok
      end
      it 'renders courses page' do
        get '/courses'
        expect(last_response.body.downcase).to include('courses')
      end
    end
    describe '/profile/register' do
      it 'gives status 200' do
        get '/profile/register'
        expect(last_response).to be_ok
      end
      it 'renders register page' do
        get '/profile/register'
        expect(last_response.body.downcase).to include('join')
      end
    end
    describe '/delete' do
      it 'gives status 200' do
        get '/delete'
        expect(session['name']).to eq(nil)
      end
    end
  end
  describe 'post methods' do
    describe '/profile/save_register' do
      it 'saves the profile' do
        post '/profile/save_register', {'name':"Juan"}
        expect(session['name']).to eq('Juan')
      end
    end
    describe '/profile/save_register' do
      it 'saves the profile' do
        post '/profile/save_register', {'name':"Juan"}
        expect(session['name']).to eq('Juan')
      end
    end
  end
end
