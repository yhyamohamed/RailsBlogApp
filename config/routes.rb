Rails.application.routes.draw do


  root "about#index"
  resources :posts

  get "/user/:id", to: "users#show", as: "user_profile"

  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }

  get "/about", to: "about#index"

end
