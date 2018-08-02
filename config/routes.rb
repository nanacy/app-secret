Rails.application.routes.draw do
	resources :users														

	root 'static_pages#home'
	
	get '/login', to:'sessions#new'
	post '/login', to: 'sessions#create'
	get '/login/show', to:'sessions#show'
	delete '/logout', to: 'sessions#destroy'
	get 'sessions/secret', to: 'sessions#secret_page'
end
