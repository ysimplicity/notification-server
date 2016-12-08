class GoogleHttpClient
  include Singleton
  
  REQUEST_HEADERS = {
    'Authorization' => "key=#{ENV.fetch('FIREBASE_SERVER_KEY')}",
    'Content-Type' => 'application/json'
  }
  
  # RFC 2616: Hypertext Transfer Protocol -- HTTP/1.1
  delegate :options, :get, :head, :post, :put, :delete, :trace, :connect, to: :request

  def request
    HTTP.headers(REQUEST_HEADERS)
  end
end
