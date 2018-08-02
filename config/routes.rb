Rails.application.routes.draw do
  get 'static_pages/home'
	resources :users																	

	get '/', to: 'static_pages#home'
	
	get '/users', to: 'users#index'

end
