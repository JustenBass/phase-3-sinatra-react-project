class PeopleController < ApplicationController

    #index route
    get '/people' do
        person = Person.all
        person.to_json(include: :errands)
      end

      #Directors show route (dynamic route)
      get '/people/:id' do
        person = Person.find_by(id: params[:id])
        if person
        person.to_json(include: :errands)
        else
            "404 - Person not found"
        end
      end

      post '/people' do
        new_person = Person.create(
          name: params[:name],
          age: params[:age],
          location: params[:location],
          account_created: params[:account_created],
        )
        new_person.to_json
    end


end
