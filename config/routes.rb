Rails.application.routes.draw do
  devise_for :users
  resources :posts, except: %i[show new]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  unauthenticated :user do
    root to: 'static#index'
  end

  authenticated :user do
    root to: 'posts#index', as: :authenticated_root
  end


end
