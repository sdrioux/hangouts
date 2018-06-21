class MessagesController < ApplicationController
  def create
    message = Message.new(message_params)
    message.sender = current_user
    message.receiver = User.find(2)
    if message.save
      ActionCable.server.broadcast 'messages',
         body: message.body,
         sender: message.sender.email,
         timestamp: message.timestamp
      head :ok
    else
      redirect_to hangouts_path
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :hangout_id)
  end
end