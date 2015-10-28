FactoryGirl.define do
  factory :article do
    title FFaker::Lorem.phrase
    description FFaker::Lorem.phrase
    text FFaker::Lorem.paragraphs
    accepted false
  end
end
