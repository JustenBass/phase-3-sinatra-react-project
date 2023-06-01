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
      am_pm: params[:am_pm]
      )
      newErrand.to_json
  end

  # patch 'people/:id/errands/:id_two' do
  #   person = Person.find(params[:id])
  #   errand = Errand.find(params[:id_two])

  #   updatePersonErrand = errand.update(
  #     errand: params[:errand],
  #     date: params[:date],
  #     time: params[:time],
  #     location: params[:location],
  #     address: params[:address],
  #     commute: params[:commute],
  #     am_pm: params[:am_pm]
  #   )
  #   # binding.pry refactor look through person errands
  #   updatePersonErrand.to_json
  # end

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
      commute: params[:commute],
      am_pm: params[:am_pm]
    )
    # binding.pry refactor look through person errands
    update_errands.to_json
  end

  delete '/people/:id/errands/:id_2' do
    delete_errand = Errand.find(params[:id_2])
    delete_errand.destroy
    #  delete off the persons table
  end

end
