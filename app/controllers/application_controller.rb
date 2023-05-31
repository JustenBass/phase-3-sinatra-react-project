class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get '/people' do
    Person.all.to_json(include: :errands)
  end



  post '/people' do
    new_person = Person.create(params)
    new_person.to_json(include: :errands)
  end

  post '/people/:id/errands' do
    person = Person.find(params[:id])
    newErrand = person.errands.create(
      errand: params[:errand],
      date: params[:date],
      time: params[:time],
      location: params[:location],
      address: params[:address],
      commute: params[:commute],
      )
      newErrand.to_json
  end

  # post '/errands' do
  #   person = Person.find_by(id: params[:person_id])
  #   errand = person.errands.create(
  #     errand: params[:errand],
  #     date: params[:date],
  #     time: params[:time],
  #     location: params[:location],
  #     address: params[:address],
  #     commute: params[:commute],
  #     )
  #   errand.to_json
  # end


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
    # binding.pry refactor look through person errands
    update_errands.to_json
  end

  delete '/errands/:id' do
    delete_errands = Errand.find(params[:id])
    delete_errands.destroy
    #  delete off the persons table
  end

end
