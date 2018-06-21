class MessagesController < ApplicationController
  def create
    message = Message.new(message_params)
    message.sender = current_user
    if message.save

      HangoutsChannel.broadcast_to(
        message.hangout,
        body: message.body,
        sender: message.sender.email,
        timestamp: message.timestamp,
        hangout_id: message.hangout_id
      )

      head :ok
    else
      flash.alert = message.errors.full_messages.join(',')
      redirect_back(fallback_location: hangout_path(user_id: message_params[:receiver_id]))
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :hangout_id, :receiver_id)
  end
end