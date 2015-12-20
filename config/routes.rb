StPenguin::Application.routes.draw do
  devise_for :authors

  resources :stories, only: [:index, :show, :new, :create, :update]

  resources :books, only: [:index, :show] do
    get :archive, on: :collection
    get :next, on: :member
  end

  root 'books#index'
end
