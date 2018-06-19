class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :sent_messages, class_name: 'Message', foreign_key: :sender_id
  has_many :received_messages, class_name: 'Message', foreign_key: :receiver_id

  def messages
    sent_messages.or(received_messages)
  end
end