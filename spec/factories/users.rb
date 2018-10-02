FactoryBot.define do
  factory :user do
    token FFaker::Internet.password
  end
end
