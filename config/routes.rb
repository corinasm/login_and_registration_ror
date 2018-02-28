Rails.application.routes.draw do
  get 'sessions/new'
  post 'sessions/create' => 'sessions#create'
  delete '/sessions/:id' => 'sessions#delete'

  get '/' => 'users#index'
  post 'users/create' => 'users#create'
  get 'events' => 'users#show'

  get 'users/new' =>'users#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
