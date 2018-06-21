class HangoutsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "hangouts_#{params[:hangout_id]}"
  end

  def typing(data)
    ActionCable.server.broadcast(
      "hangouts_#{params[:hangout_id]}",
      typing: true,
      hangout_id: params[:hangout_id],
      user_id: data['user_id']
    )
  end
end