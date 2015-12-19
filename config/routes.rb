StPenguin::Application.routes.draw do
  devise_for :authors

  namespace :scriptorium do
    resources :stories, only: [:index, :show, :new, :create, :update]
    resource :desk, only: :show
  end

  resources :books, only: [:index, :show] do
    get :archive, on: :collection
    get :next, on: :member
  end

  root 'books#index'
end
