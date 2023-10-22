Rails.application.routes.draw do

# root to: "homes#top"
root to: 'public/homes#top'
scope module: :public do
  get "/about" => "homes#about"
  get "customers/mypage" => "customers#show"
  get "customers/information/edit" => "customers#edit"
  patch "customers/information" => "customers#update"
  get "customers/check" => "customers#check"
  patch "customers/withdraw" => "customers#withdraw"

  resources :items, only: [:index,:show]

  resources :cart_items, only: [:index, :update, :destroy, :create] do
    collection do
      delete "destroy_all"
    end
  end

  resources :orders, only: [:new, :create, :index, :show] do
    collection do
      get "check"
      get "completion"
    end
  end

  resources :addresses, except: [:show]

  end
# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
  get '/search'=>'search#search'
  resources :items,only: [:index,:new,:create,:show,:edit,:update,]
  resources :genres,only: [:index,:create,:edit,:update, :show]
  resources :customers,only: [:index,:new,:create,:show,:edit,:update]
  resources :orders,only: [:show,:update] do
    resource :order_details,only: [:update]
  end
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end