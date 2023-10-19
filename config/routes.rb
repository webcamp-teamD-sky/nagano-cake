Rails.application.routes.draw do
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

  root to: 'public/homes#top'

namespace :public, path: '' do
  resources :orders, only: [:new, :index, :show, :create] do
    collection do
      get :check
      get :completion
    end
  end
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end