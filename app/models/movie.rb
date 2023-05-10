class Movie < ActiveRecord::Base
    belongs_to :actor

    def self.create_movie(actor, movie)
        find_actor = Actor.find(actor)
        create_movie = self.create(movie)
        find_actor.movies << create_movie
    end



end