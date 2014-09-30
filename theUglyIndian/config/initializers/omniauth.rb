OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '814035995890-848eit5ice11n5jjc0srqg2pesffp2jo.apps.googleusercontent.com', 'mhac6RB65RwpBXotqrB1fSXg'
end