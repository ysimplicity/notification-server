class WebAppReceiver
  include Singleton
  
  CONFIG_FILENAME = 'web_app_receiver'.freeze
  
  delegate :host, :default_icon_path, to: :config
  
  def config
    @config ||= OpenStruct.new(
      Rails.application.config_for(CONFIG_FILENAME)
    )
  end
  
  def default_icon_url
    url_for(default_icon_path)
  end
  
  def url_for(path)
    path = path.strip
    path = "/#{path}" if path !~ /^\//
    
    _host = host.strip
    _host = _host.chop if _host =~ /\/$/
    
    "#{host}#{path}"
  end
end
