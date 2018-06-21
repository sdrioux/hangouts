require 'rails_helper'

describe UsersController do
  describe '#index' do
    let(:current_user) { create(:user) }
    let(:other_user) { create(:user) }

    before do
      sign_in current_user
    end

    it 'gets all other users' do
      get :index

      users = assigns(:users)

      expect(users).to eq([other_user])
    end

    it 'gets a count of all messages sent to other users' do
      create(:message, sender: current_user, receiver: other_user)
      # should not be included
      create(:message, sender: other_user, receiver: current_user)

      get :index

      messages_sent = assigns(:messages_sent)

      expect(messages_sent).to eq(
        other_user.id => 1
      )
    end

    it 'gets a count of all messages received from other users' do
      create(:message, sender: other_user, receiver: current_user)
      # should not be included
      create(:message, sender: current_user, receiver: other_user)

      get :index

      messages_received = assigns(:messages_received)

      expect(messages_received).to eq(
        other_user.id => 1
      )
    end
  end
end