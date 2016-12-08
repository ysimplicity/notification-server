# https://developers.google.com/instance-id/reference/server
class GoogleInstanceIdClient
  DEFAULT_TOPIC_SUBSCRIPTION = ENV.fetch('DEFAULT_TOPIC_SUBSCRIPTION').freeze
  TO_DEFAULT_TOPIC = "/topics/#{DEFAULT_TOPIC_SUBSCRIPTION}".freeze
  
  URL_TO_INFO_ABOUT_APP_INSTANCES = 'https://iid.googleapis.com/iid/info/%{registration_token}'.freeze
  URL_TO_TOPIC_SUBSCRIPTION = 'https://iid.googleapis.com/iid/v1/%{registration_token}/rel/topics/%{topic_name}'.freeze
  
  def self.to_default_topic
    TO_DEFAULT_TOPIC
  end

  def initialize(user)
    @user = user
    @registration_token_param = { registration_token: user.token }
    @request = GoogleHttpClient.instance
  end
  
  def info_about_app_instances(details: false)
    url = URL_TO_INFO_ABOUT_APP_INSTANCES % request_params
    url = "#{url}?details=#{details}"
    
    @request.get(url)
  end
  
  def subscribe_topic(name)
    url = URL_TO_TOPIC_SUBSCRIPTION % request_params(topic_name: name)
    
    @request.post(url)
  end
  
  def subscribe_default_topics
    topics = [DEFAULT_TOPIC_SUBSCRIPTION]
    topics << "user_#{@user.uid}" if @user.uid.present?
    
    Parallel.map(topics, in_threads: 2) { |name| subscribe_topic(name) }
  end
  
  def request_params(data={})
    @registration_token_param.dup.merge(data)
  end
end
