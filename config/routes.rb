Rails.application.routes.draw do
  resources :t1s
  resources :projects

  devise_for :users, controllers: {
      omniauth_callbacks: "users/callbacks"
  }

  root "account#index"

  resources :accounts, path: '' do
    resources :peoples
    resources :companies
    resources :administrators

    resources :projects do
      resources :todo_sets, path: 'todosets' do
        resources :todos do
          resources :comments, module: :todos
        end
        resources :comments, module: :todo_sets
      end
    end
  end

  # resources :users, path: '' do
  #   get '/account', to: 'accounts#show'
  #
  #   resources :projects do
  #     resources :todo_sets, path: 'todosets' do
  #       resources :todos do
  #         resources :comments, module: :todos
  #       end
  #       resources :comments, module: :todo_sets
  #     end
  #   end
  # end

  resources :todo_sets do
    resources :comments, module: :todo_sets
    resources :todos

    resources :todo_groups, path: "groups", only: %i[create]
    delete '/promote', to: 'todo_groups#destroy'
  end

  resources :comments do
    resources :boosts, module: :comments
  end

  resources :boosts, only: [:destroy]
  resources :comments, only: %i[destroy update]
  # resources :projects, only: %i[index create new show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
