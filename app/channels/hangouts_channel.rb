class HangoutsChannel < ApplicationCable::Channel
  def subscribed
    hangout = Hangout.find(params[:hangout_id])

    stream_for hangout
  end
end