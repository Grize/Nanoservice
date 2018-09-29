FactoryBot.define do
  factory :message do
    sender FFaker::NameDA.female_name
    addressee FFaker::NameDA.female_name
    body FFaker::Lorem.paragraph
    sent FFaker::Boolean.maybe
  end
end
