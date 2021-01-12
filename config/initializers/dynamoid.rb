require 'dynamoid'
Dynamoid.configure do |config|
  config.access_key = ENV['ACCESS_KEY_ID']
  config.secret_key = ENV['SECRET_ACCESS_KEY']
  config.region = 'us-east-1'

  config.namespace = "sr_#{Rails.env}"
end

