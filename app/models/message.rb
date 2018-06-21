class Message < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  belongs_to :hangout

  validates :body, presence: true

  def timestamp
    created_at.strftime('%b %e, %Y %H:%M:%S %p')
  end
end