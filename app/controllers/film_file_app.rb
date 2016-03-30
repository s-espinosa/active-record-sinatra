class FilmFile < Sinatra::Base
  get '/films' do
    @films = Film.all
    erb :films_index
  end

  get '/genres' do
    @genres = Genre.all
    erb :genres_index
  end

  post '/genres' do
    genre = Genre.new(params[:genre])

    if genre.save
      status 200
      body "Genre Created"
    else
      status 400
      body "Missing Name"
    end
  end

  get '/directors/:id' do |id|
    @director = Director.find(id)
    erb :director_show
  end
end
