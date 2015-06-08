Rails.application.routes.draw do

get '/todos/', to: 'todos#index'

get '/todos/new', to: 'todos#new'

post '/todos/', to: 'todos#create'

delete '/todos/:id', to: 'todos#delete'

get '/todos/:id', to: 'todos#show'

root to: 'todos#index'

match '*not_found_route', to: 'application#skip_cors', via: [:get, :post, :put, :delete]

end
