require 'rails_helper'

describe MessagesController do
  describe '#create' do
    context 'when successful' do
      it 'creates a message' do
        current_user = create(:user)
        sign_in current_user

        receiver = create(:user)
        hangout = create(:hangout, first_user: current_user, second_user: receiver)

        message_params = {
          body: 'Hello there.',
          hangout_id: hangout.id,
          receiver_id: receiver.id
        }
        expect {
          post :create, params: { message: message_params }
        }.to change {
          hangout.messages.count
        }.by(1)
      end

      it 'publishes that message', freeze_time: Time.new(1988, 8, 17, 3, 15) do
        current_user = create(:user)
        sign_in current_user

        receiver = create(:user)
        hangout = create(:hangout, first_user: current_user, second_user: receiver)

        message_params = {
          body: 'Hello there.',
          hangout_id: hangout.id,
          receiver_id: receiver.id
        }

        ActionCable.server.expects(:broadcast).with(
          "hangouts_#{hangout.id}",
          hangout_id: hangout.id,
          message: {
            body: 'Hello there.',
            sender: 'user_3@gmail.com',
            timestamp: 'Aug 17, 1988 03:15:00 AM',
            hangout_id: hangout.id
        })

        post :create, params: { message: message_params }
      end
    end

    context 'when not successful' do
      it 'redirects back to hangout path' do
        current_user = create(:user)
        sign_in current_user

        receiver = create(:user)
        hangout = create(:hangout, first_user: current_user, second_user: receiver)

        message_params = {
          hangout_id: hangout.id,
          receiver_id: receiver.id
        }

        post :create, params: { message: message_params }

        expect(response).to redirect_to hangout_path(user_id: receiver.id)
      end
    end
  end
end
