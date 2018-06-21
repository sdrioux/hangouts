class Hangout < ApplicationRecord
  has_many :messages

  belongs_to :first_user, class_name: 'User'
  belongs_to :second_user, class_name: 'User'

  def users
    User.where(id: [first_user_id, second_user_id])
  end
end