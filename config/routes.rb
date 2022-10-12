Rails.application.routes.draw do
  get 'posts/index'

  root "about#index"

  get "/user/:id", to: "users#show", as: "user_profile"

  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }

  get "/about", to: "about#index"

end
