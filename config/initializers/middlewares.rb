Rails.application.config.middleware.use Rack::Deflater

# CORS
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins String(ENV.fetch('APPLICATION_CORS_ORIGINS')).split(' ')
    resource '/api/*',
      headers: :any,
      methods: %i(post put patch)
  end
end
