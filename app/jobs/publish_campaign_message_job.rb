class PublishCampaignMessageJob < ApplicationJob
  queue_as :default

  def perform(campaign_id)
    campaign = Campaign.find_by id: campaign_id
    
    GoogleFcmClient.new(campaign).send_message
  end
end
