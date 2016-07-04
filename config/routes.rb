Rails.application.routes.draw do

  get 'profile/show'

  get 'profile/edit'

  resources :flats
  resources :posts

  root 'welcome#index'

  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }

  resources :users do
    resources :emails
  end

  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

end
