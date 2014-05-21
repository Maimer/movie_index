require 'sinatra'
require_relative 'helpers'
require 'pry'

get '/' do
  redirect '/movies?page=1'
end

get '/movies' do
  @title = "Movie Index"
  @pagename = params[:page]
  if params[:query]
    @query = params[:query].split
  end
  @data = build_data().sort_by { |moviehash| moviehash["title"].downcase }
  if !@query.nil?
    @results = search_results(@data, @query)
  end
  erb :'movies/index'
end

get '/movies/:movie_id' do
  @id = params[:movie_id]
  @data = build_data()
  @title = find_id(@data, @id)
  @movie = find_movie(@data, @id)
  erb :'movies/moviepage'
end
