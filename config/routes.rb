Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'pages#landing'

  resources :entries, only: [ :index, :show ]
  resources :event_logs, only: [ :index, :create ]

  get '/:uuid/:major/:minor' => 'entries#show'
end
