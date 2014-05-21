require 'sinatra'
load 'helpers.rb'

get '/' do
  redirect '/movies'
end

get '/movies' do
  @title = "Movie Index"
  @data = build_data().sort_by { |moviehash| moviehash["title"]}
  erb :'movies/index'
end

get '/movies/:movie_id' do
  @movie_name = params[:movie_id]

  erb :moviepage
end
