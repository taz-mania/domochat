Rails.application.routes.draw do

<<<<<<< HEAD
  resources :flats
  resources :posts
=======
  resources :posts
>>>>>>> fda92f1487f9025452dd0e824587be4b74a6009c
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }

  root 'welcome#index'
  
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

end
