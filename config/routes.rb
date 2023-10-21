Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  scope 'api/v1' do
    devise_for :users, path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      registration: 'signup'

    }, controllers: {
      sessions: 'user/sessions',
      registrations: 'user/registrations',
      passwords: 'user/passwords',
      confirmations: 'user/confirmations'
    }
  end
end
