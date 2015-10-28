FactoryGirl.define do
  factory :user do
    nickname FFaker::Lorem.word
    email FFaker::Internet.email
    password FFaker::Internet.password
    #role '123'
    after(:create) { |a| FactoryGirl.create(:article, patternable: a)}
  end

end
