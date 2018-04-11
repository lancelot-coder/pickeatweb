Rails.application.routes.draw do
  get 'reviews/show'

  get 'reviews/edit'

  get 'reviews/new'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'about' => 'pages#about', as: 'about'
  get 'properties-grid' => 'pages#properties-grid', as: 'properties-grid'
  get 'properties-single' => 'pages#properties-single', as: 'properties-single'
  get 'team' => 'pages#team', as: 'team'
  get 'team-single' => 'contacts#team-single', as: 'team-single'
  root to: "home#index"

  devise_for :users

  resources :restaurants
  resources :contacts
  resources :reviews
end
