class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  http_basic_authenticate_with name: ENV.fetch('APPLICATION_AUTH_NAME'),
                               password: ENV.fetch('APPLICATION_AUTH_PASSWORD')
end
