RailsAdmin.config do |config|

  config.main_app_name = ["iBeacon CMS", "admin"]
  config.authorize_with do
    authenticate_or_request_with_http_basic('iBeacon CMS Admin') do |username, password|
      username == 'beacons' && password == 'sindscheisse'
    end
  end

  config.included_models = %w{Entry}

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
