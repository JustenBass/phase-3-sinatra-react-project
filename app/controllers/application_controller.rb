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

  patch '/people/:id/errands/:id_two' do
    editErrand = Errand.find(params[:id_two])

    editErrand.update(
      errand: params[:errand],
      date: params[:date],
      time: params[:time],
      location: params[:location],
      address: params[:address],
      commute: params[:commute],
      am_pm: params[:am_pm]
    )
    editErrand.to_json
  end


  delete '/people/:id/errands/:id_2' do
    delete_errand = Errand.find(params[:id_2])
    delete_errand.destroy
  
  end

end
