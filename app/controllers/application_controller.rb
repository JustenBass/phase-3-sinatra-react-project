class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'


  get '/people' do
    Person.all.to_json(include: :errands)
  end

  post '/people' do
    new_person = Person.create(params)
    new_person.to_json(include: :errands)
  end

 

  patch '/people/:person_id/errands/:errand_id' do
    editErrand = Errand.find(params[:errand_id])

    editErrand.update(
      errand: params[:errand],
      date: params[:date],
      time: params[:time],
      am_pm: params[:am_pm],
      location: params[:location],
      address: params[:address],
    )
    editErrand.to_json
  end


  delete '/people/:person_id/errands/:errand_id' do
    delete_errand = Errand.find(params[:errand_id])
    delete_errand.destroy

  end

end
