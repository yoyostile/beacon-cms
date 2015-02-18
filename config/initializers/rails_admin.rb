RailsAdmin.config do |config|
  if Rails.env.production?
    config.authorize_with do
      authenticate_or_request_with_http_basic('Site Message') do |username, password|
        username == ENV['ADMIN_USER'] && password == ENV['ADMIN_PASS']
      end
    end
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end
end
