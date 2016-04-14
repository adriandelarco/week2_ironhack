require File.expand_path '../spec_helper.rb', __FILE__

RSpec.describe 'server' do
  describe 'get methods' do
    describe 'index' do
      it 'gives status 200' do
        get '/index'
        expect(last_response).to be_ok
      end
      it 'renders index page' do
        get '/index'
        expect(last_response.body.downcase).to include('blog')
      end
    end
    describe 'post_details' do
      it 'gives status 200' do
        get '/post_details/1'
        expect(last_response).to be_ok
      end
    end
    describe 'new_post' do
      it 'gives status 200' do
        get '/new_post'
        expect(last_response).to be_ok
      end
    end
  end
end
