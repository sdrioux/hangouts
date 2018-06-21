class Hangout < ApplicationRecord
  has_many :messages

  belongs_to :first_user, class_name: 'User'
  belongs_to :second_user, class_name: 'User'

  def users
    User.where(id: [first_user_id, second_user_id])
  end

  def self.for_user_ids(user_ids)
    Hangout.find_by(first_user_id: user_ids, second_user_id: user_ids)
  end
end