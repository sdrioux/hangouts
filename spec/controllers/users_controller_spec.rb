require 'rails_helper'

describe UsersController do
  describe '#index' do
    it 'gets all other users' do
      current_user = create(:user)
      other_user = create(:user)

      sign_in current_user

      get :index

      users = assigns(:users)

      expect(users).to eq([other_user])
    end
  end
end