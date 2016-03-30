require './test/test_helper'

class CreateGenreTest < Minitest::Test
  include Rack::Test::Methods

  def app
    FilmFile
  end

  def setup
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end

  def test_create_genre_with_valid_attributes
    assert_equal 0, Genre.count
    post '/genres', { genre: { name: 'Cartoon' } }

    assert_equal 200, last_response.status
    assert_equal 1, Genre.count
    assert_equal "Genre Created", last_response.body
  end

  def test_cannot_create_without_valid_attributes
    assert_equal 0, Genre.count
    post '/genres', { genre: {} }

    assert_equal 400, last_response.status
    assert_equal "Name can't be blank", last_response.body
    assert_equal 0, Genre.count
  end
end
