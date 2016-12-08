# https://developers.google.com/instance-id/reference/server
class GoogleFcmClient
  URL_TO_SEND_MESSAGES = 'https://fcm.googleapis.com/fcm/send'

  def initialize(campaign)
    @campaign = campaign
    @request = GoogleHttpClient.instance
  end
  
  def send_message
    @request.post(URL_TO_SEND_MESSAGES, json: payload_to_send_a_message)
  end
  
  def payload_to_send_a_message
    {
      notification: {
        title: @campaign.title,
        body: @campaign.body,
        icon: @campaign.icon,
        click_action: @campaign.click_action
      },
      to: @campaign.to
    }
  end
end
