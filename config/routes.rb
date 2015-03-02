Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'pages#landing'

  resources :entries, only: [ :index, :show ]

  get '/:uuid/:major/:minor' => 'entries#show'
end
