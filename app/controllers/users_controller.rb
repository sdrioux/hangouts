class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.where.not(id: current_user.id)
    @messages_sent = Message.where(sender: current_user).group(:receiver_id).count
    @messages_received = Message.where(receiver: current_user).group(:sender_id).count
  end
end