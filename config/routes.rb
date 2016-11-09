Rails.application.routes.draw do
  devise_for :users
  resources :mehmen do
  	member do
  	  patch :return
  	  patch :back
  	end
  end
  
  resources :searches

  root 'mehmen#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
