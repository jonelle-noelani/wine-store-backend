Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :wines, :users, :cart_items

      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      post '/charges', to: 'charges#create'
    end
  end
end
