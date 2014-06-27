Rails.application.routes.draw do
	  
	get '/', to:'elsewhere#index', as: 'home'

  get '/search', to: 'elsewhere#search'

	get '/:country_name', to: 'elsewhere#show', as: "country"

end