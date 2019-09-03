Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'books#index'
  #why does it need to be author_id not just id
  get '/books', to: 'books#index'
  get '/authors', to: 'authors#index'
  get '/authors/new', to: 'authors#new'
  post '/authors', to: 'authors#create'
  get '/authors/:id', to: 'authors#show'
  get '/authors/:author_id/books/new', to: 'books#new'
  post '/authors/:author_id/books', to: 'books#create'
end
