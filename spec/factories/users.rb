FactoryGirl.define do
  factory :user do
    email "MyString"
    password "MyString"
    username "MyString"
    confirmed_at (Time.now-3000)
  end
end