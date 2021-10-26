Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'lists#home'
  resources :lists, only: %I[index show create new] do
    resources :bookmarks, only: [:create]
  end
  resources :bookmarks, only: :destroy
end
