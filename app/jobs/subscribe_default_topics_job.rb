class SubscribeDefaultTopicsJob < ApplicationJob
  queue_as :default

  def perform(token)
    user = User.find_by token: token
    
    user.iid.subscribe_default_topics
  end
end
