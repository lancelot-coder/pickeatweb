Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'team-single' => 'contacts#team-single', as: 'team-single'
  root to: "home#index"

  devise_for :users

  resources :restaurants do
    resources :restaurant_photos
  end
  resources :contacts
  resources :reviews

end
