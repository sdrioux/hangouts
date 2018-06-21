FactoryBot.define do
  factory :message do
    association :sender, factory: :user
    association :receiver, factory: :user
    association :hangout
    body "These aren't the droids you're looking for."
  end
end
