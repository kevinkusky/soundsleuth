Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_CLIENT_SECRET'], scope: 'user-read-email user-library-read', redirect_uri: ENV['SPOTIFY_REDIRECT_URI'], provider_ignores_state: true
end
