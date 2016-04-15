require File.expand_path('../../lib/imdb.rb', __FILE__)
require File.expand_path('../../lib/fake_array.rb', __FILE__)
require 'pry'
RSpec.describe '/lib/.imdb' do
  describe '#request_movies' do
    it 'returns and array with 9 elements' do
      new_search = Imdb_movies.new
      new_search.fake_search(Fake_array.new.starwars)
      expect(new_search.movies.size).to eq(9)
    end
    it 'returns and array with 9 movies' do
      new_search = Imdb_movies.new
      new_search.fake_search(Fake_array.new.starwars)
      expect(new_search.movies).to include([['http://ia.media-imdb.com/images/M/MV5BOTIyMDY2NGQtOGJjNi00OTk4LWFhMDgtYmE3M2NiYzM0YTVmXkEyXkFqcGdeQXVyNTU1NTcwOTk@.jpg'], ['La guerra de las galaxias (1977)']])
    end
  end
end
