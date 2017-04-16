Rails.application.routes.draw do
  get 'bike/index'

  resources :locations
  resources :profiles
  devise_for :users
  get '/signedinuserprofile' => 'profiles#signedinuserprofile'
  resources :cycles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'bike#index'

end
