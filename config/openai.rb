OpenAI.configure do |config|
  config.access_token = ENV.fetch('Rails.application.credentials.open_ai[:secret_access_key]')
end
