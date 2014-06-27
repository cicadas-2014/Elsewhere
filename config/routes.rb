Rails.application.routes.draw do

	get '/', to:'elsewhere#index', as: 'home'

	get '/:country_name', to: 'elsewhere#show', as: "country"

end
