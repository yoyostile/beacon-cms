Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'pages#landing'

  get '/:uuid/:major/:minor' => 'entries#show'  
end
