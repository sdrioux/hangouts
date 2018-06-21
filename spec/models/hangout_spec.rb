require 'rails_helper'

describe Hangout do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:first_user).with_message('must exist') }
    it { is_expected.to validate_presence_of(:second_user).with_message('must exist') }
  end

  describe '#users' do
    it 'returns both users involved in the hangout' do
      user_1 = create(:user)
      user_2 = create(:user)
      hangout = create(:hangout, first_user: user_1, second_user: user_2)

      expect(hangout.users).to eq([user_1, user_2])
    end
  end
end