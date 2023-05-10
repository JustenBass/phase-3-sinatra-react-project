class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # Add your routes here
  get "/actors" do
    actors = Actor.all
    actors.to_json
end

get "/actors/movies/:id" do
find_actor = Actor.actor_list_of_movies(params[:id])
find_actor.to_json
end

get "/actors/count" do
  actor_count = Actor.actor_count
  phrase = "There are #{actor_count} actors!"
  phrase.to_json
end

get "/movies" do
  movies = Movie.find_movie_by_year
  movies.to_json
end



end
