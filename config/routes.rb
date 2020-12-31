Rails.application.routes.draw do

  get 'todos/create'
  resources :t1s
  resources :projects

  devise_for :users
  root "users#show"

  resources :users do
    resources :projects do
      resources :todo_lists do
        resources :todos
      end
    end

    resource :bucket

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
