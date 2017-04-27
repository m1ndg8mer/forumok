require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.name { Faker::Name }
    f.email { Faker::Internet.email }
    f.password { Faker::Internet.password(6) }
  end
end