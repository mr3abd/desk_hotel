Rails.application.routes.draw do

  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  scope 'api/v1' do
    resources :reservation, only: %i[create index update]
    resources :room
    resources :room_type, only: :index
    devise_for :users, path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      registration: 'signup'

    }, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      passwords: 'users/passwords',
      confirmations: 'users/confirmations'
    }
  end
end
