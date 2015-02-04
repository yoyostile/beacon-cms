CarrierWave.configure do |config|
  if Rails.env.development?
    config.storage = :file
  elsif Rails.env.test?
    config.enable_processing = false
  else
    config.storage = :fog
    config.fog_credentials = {
      provider: 'AWS',
      region: 'eu-central-1',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
    }
    config.fog_directory = ENV['AWS_BUCKET']
    config.fog_public = true
  end
end
