class HangoutsController < ApplicationController
  before_action :authenticate_user!

  def show
    @sender = current_user
    @receiver = User.find(params[:user_id])
    @hangout = Hangout.find_by(
      first_user: [@sender, @receiver],
      second_user: [@sender, @receiver]
    )

    @hangout ||= Hangout.create(first_user: @sender, second_user: @receiver)

    @message = Message.new(
      sender: @sender,
      receiver: @receiver,
      hangout: @hangout
    )
  end
end
