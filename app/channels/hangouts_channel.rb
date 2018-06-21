class HangoutsChannel < ApplicationCable::Channel
  def subscribed
    puts params
    hangout = Hangout.find(params[:room])

    stream_for hangout
  end
end