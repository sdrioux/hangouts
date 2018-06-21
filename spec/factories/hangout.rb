FactoryBot.define do
  factory :hangout do
    association :first_user, factory: :user
    association :second_user, factory: :user
  end
end
