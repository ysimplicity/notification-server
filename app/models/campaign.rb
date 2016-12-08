class Campaign
  include Mongoid::Document
  include Mongoid::Paranoia
  include Mongoid::Timestamps::Created
  
  field :name, type: String
  field :title, type: String
  field :body, type: String
  field :icon, type: String, default: ->{ WebAppReceiver.instance.default_icon_path }
  field :click_action, type: String, default: ->{ WebAppReceiver.instance.host }
  field :to, type: String, default: ->{ GoogleInstanceIdClient.to_default_topic }
  
  validates :name, :title, :body, :icon, :click_action, :to, presence: true
  
  def icon_url
    WebAppReceiver.instance.url_for(self.icon)
  end
end
