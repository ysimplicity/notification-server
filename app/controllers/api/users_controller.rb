class API::UsersController < ActionController::API
  rescue_from 'ActionController::ParameterMissing' do
    render json: {error: true}
  end
  
  def create
    user = build_user
    
    set_user_data(user)
    
    unless is_error = !user.save
      SubscribeDefaultTopicsJob.perform_later(user.token)
    end
    
    render json: {error: is_error}
  end
  
  private
  
    def user_params
      params.require(:user).permit(:uid, :email, :token)
    end
    
    def build_user
      user_params[:token].present? ? find_user : User.new
    end
    
    def find_user
      User.find_by(token: user_params[:token])
    rescue Mongoid::Errors::DocumentNotFound
      User.new
    end
    
    def set_user_data(user)
      user.uid ||= user_params[:uid]
      user.email ||= user_params[:email]
      user.token = user_params[:token]
    end
end
