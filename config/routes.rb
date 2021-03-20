Rails.application.routes.draw do
  get 'messages/new'
  get 'messageboards/index'
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
	    resources :message_boards, controller: 'messageboards', only: %i[show] do
		    resources :messages
      end

      resources :todo_sets, path: 'todosets' do
        resources :todos do
          resources :comments, module: :todos
        end
        resources :comments, module: :todo_sets
      end
    end
  end

  resources :users, path: '' do
    get '/account', to: 'accounts#show'

    resources :projects do
      resources :todos do
        resources :comments, module: :todos
      end
      resources :todo_sets, path: 'todosets' do
        resources :todos do
          resources :comments, module: :todos
        end
        resources :comments, module: :todo_sets
      end
    end
  end

  resources :todo_sets do
    resources :comments, module: :todo_sets
    resources :todos

    resources :todo_groups, path: "groups", only: %i[create]
    delete '/promote', to: 'todo_groups#destroy'
  end

  resources :todos do
    resources :comments, module: :todos
  end

  resources :comments do
    resources :boosts, module: :comments
  end

  resources :message_boards, controller: 'messageboards', only: %i[show] do
    resources :messages
  end

  resources :boosts, only: [:destroy]
  resources :comments, only: %i[destroy update]
  # resources :projects, only: %i[index create new show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
