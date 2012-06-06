Tuxedoweasels::Application.routes.draw do

  root :to => 'comic#index'

  resources :users
  resources :sessions

  match '/signup',  :to => 'users#new'
  match '/signin',  :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy', via: :delete
  match '/admin',   :to => 'admin#index'

end
