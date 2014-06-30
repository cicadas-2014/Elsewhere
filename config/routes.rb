Rails.application.routes.draw do

	get '/', to:'elsewhere#index', as: 'home'

get '/directions', to: 'elsewhere#direction', as: 'direction'


	get '/:country_name', to: 'elsewhere#show', as: "country"



end
