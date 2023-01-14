Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    # Airports
    get '/airports', to: 'airports#index'
    post '/airports', to: 'airports#create'
    patch '/airports/:id', to: 'airports#update'
    delete '/airports/:id', to: 'airports#delete'

    # Routes
    get '/routes', to: 'routes#index'

    # Flights
    get '/flights', to: 'flights#index'
  end

  # Airports
  get '/airports', to: 'airports#index'
  get '/airports/new', to: 'airports#new'
  get '/airports/:id', to: 'airports#show'
  get '/airports/:id/edit', to: 'airports#edit'
  post '/airports/create', to: 'airports#create'
  post '/airports/:id/update', to: 'airports#update'
  post '/airports/:id/delete', to: 'airports#delete'

  # Routes
  get '/routes', to: 'routes#index'
  get '/routes/new', to: 'routes#new'
  get '/routes/:id', to: 'routes#show'
  get '/routes/:id/edit', to: 'routes#edit'
  post '/routes/create', to: 'routes#create'
  post '/routes/:id/update', to: 'routes#update'
  post '/routes/:id/delete', to: 'routes#delete'

  # Flights
  get '/flights', to: 'flights#index'
  get '/flights/new', to: 'flights#new'
  get '/flights/:id', to: 'flights#show'
  get '/flights/:id/edit', to: 'flights#edit'
  post '/flights/create', to: 'flights#create'
  post '/flights/:id/update', to: 'flights#update'
  post '/flights/:id/delete', to: 'flights#delete'

  get '/test', to: 'flights#test'
end
