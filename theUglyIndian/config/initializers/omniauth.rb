OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '814035995890-3m60bhv4f5bnitcnf3p4trgq77iqmcv8.apps.googleusercontent.com', 'EegYs1qag9yrATxEsaIx5-mx'
end