class ErrandsController < ApplicationController

    #index route
    get '/errands' do
        errand = Errand.all
        errand.to_json
      end

      post '/errands' do
        # new_errand = Errand.create(
        #   errand: params[:errand],
        #   date: params[:date],
        #   time: params[:time],
        #   location: params[:location],
        #   address: params[:address],
        #   commute: params[:commute],
        #   person_id: params[:person_id]
        # )
        person = Person.find_by(params[:person_id])
        errand = person.errands.create(
          errand: params[:name],
          date: params[:date],
          time: params[:time],
          location: params[:location],
          address: params[:address],
          commute: params[:commute]

          )
        new_errand.to_json
    end

    patch '/errands/:id' do
      update_errands = Errand.find(params[:id])
      update_errands.update(
        errand: params[:errand],
        date: params[:date],
        time: params[:time],
        location: params[:location],
        address: params[:address],
        commute: params[:commute]
      )
      # binding.pry
      update_errands.to_json
    end

    delete '/errands/:id' do
      delete_errands = Errand.find(params[:id])
      delete_errands.destroy
      delete_errands.to_json
    end

end