class Campaigns::PublishController < ApplicationController
  def create
    campaign_id = params[:id]
    
    if campaign_id.present?
      PublishCampaignMessageJob.perform_later(campaign_id)
      
      respond_to do |format|
        format.html { redirect_to campaigns_url, notice: 'Campaign was successfully published.', turbolinks: :replace }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to campaigns_url, notice: 'Please, send a valid campaign!' }
        format.json { head :unprocessable_entity }
      end
    end
  end
end
