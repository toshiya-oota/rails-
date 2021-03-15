Rails.application.routes.draw do
  namespace :system do
    get 'roles/index'
    get 'roles/new'
    get 'roles/edit'
  end
  devise_scope :system_user do
    get 'login' => 'system_users/sessions#new', as: :new_system_user_session
    post 'login' => 'system_users/sessions#create', as: :system_user_session
    delete 'logout' => 'system_users/sessions#destroy', as: :destroy_system_user_session
    get 'sign_up' => 'system_users/registrations#new', as: :sign_up_system_user
    post 'sign_up' => 'system_users/registrations#create', as: :register_system_user
  end
  devise_for :system_users, skip: :all

  get 'reset_password' => 'system/system_users#reset_password', as: :reset_password_system_system_user
  get 'update_password' => 'system/system_users#update_password', as: :update_password_system_system_user

  root :to => 'toppage#index'

  namespace :parent do
    resources :parents
  end

  namespace :product do
    resources :products do
      member do
        get :download
      end
    end
  end

  namespace :customer do
    resources :customers
  end

  namespace :system do
    resources :system_users
    resources :roles
  end
end
