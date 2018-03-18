Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'about' => 'pages#about', as: 'about'
  get 'properties-grid' => 'pages#properties-grid', as: 'properties-grid'
  get 'properties-list' => 'pages#properties-list', as: 'properties-list'
  get 'properties-map' => 'pages#properties-map', as: 'properties-map'
  get 'properties-single' => 'pages#properties-single', as: 'properties-single'
  get 'team' => 'pages#team', as: 'team'
  get 'team-single' => 'pages#team-single', as: 'team-single'
  get 'contact' => 'pages#contact', as: 'contact'
  root to: "pages#index"

end
