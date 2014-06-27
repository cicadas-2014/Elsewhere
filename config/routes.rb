Rails.application.routes.draw do
  
get '/', to:'elsewhere#index', as: 'home'
get '/results', to: 'elsewhere#results', as: 'results'

end
