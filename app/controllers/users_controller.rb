class UsersController < ApplicationController
  def index
    @users = User.order_by(created_at: :desc)
  end
end
