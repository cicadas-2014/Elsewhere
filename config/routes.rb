Rails.application.routes.draw do
  
get '/', to:'elsewhere#index', as: 'home'


end
