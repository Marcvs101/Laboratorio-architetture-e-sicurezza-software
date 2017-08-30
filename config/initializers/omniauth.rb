OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '195168674350473', '1bf8b3b53b352d1aaf6ec7ba6ae98240'
end
