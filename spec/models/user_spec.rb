require 'rails_helper'

describe User do
  describe '#messages' do
    it 'returns all messages the user has sent or received' do
      user = create(:user)
      sent_message = create(:message, sender: user)
      received_message = create(:message, receiver: user)

      expect(user.messages.pluck(:id).sort).to eq [sent_message.id, received_message.id].sort
    end
  end

  describe '#hangouts' do
    it 'returns all hangouts the user is involved in' do
      user = create(:user)
      hangout1 = create(:hangout, first_user: user)
      hangout2 = create(:hangout, second_user: user)

      expect(user.hangouts.pluck(:id).sort).to eq [hangout1.id, hangout2.id].sort
    end
  end
end