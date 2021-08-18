Rails.application.routes.draw do
  get 'products/index'

  get 'products/show'


  devise_for :users
  resources :taggings
  resources :tags, except: :show
  resources :books
  resources :line_items, only:[:index, :show, :new, :create, :destroy] do
    collection do
      post :confirm
    end
  end

  resources :products
  resources :orders, only:[:index, :show, :new, :create] do
    collection do
      post :confirm
    end
  end

  resources :order_details
  resources :carts

  root 'products#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  devise_scope :user do
    get '/user/sign_out' => 'devise/sessions#destroy'
  end

  root to: 'mypage#index'
  get :mypage, to: 'mypage#index'

end
