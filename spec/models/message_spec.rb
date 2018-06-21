require 'rails_helper'

describe Message do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_presence_of(:sender).with_message('must exist') }
    it { is_expected.to validate_presence_of(:receiver).with_message('must exist') }
    it { is_expected.to validate_presence_of(:hangout).with_message('must exist') }
  end

  describe '#timestamp' do
    it 'returns created_at in a readable format', freeze_time: Time.new(1988, 8, 17, 3, 15) do
      message = create(:message)

      expect(message.timestamp).to eq('Aug 17, 1988 03:15:00 AM')
    end
  end
end