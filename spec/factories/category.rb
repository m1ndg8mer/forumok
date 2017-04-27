require 'faker'

FactoryGirl.define do

	factory :category do |f|
	    f.title { Faker::Lorem.word }
	    f.body { Faker::Lorem.sentence }
	    f.published true
	end

	factory :invalid_category, parent: :category do |f|
	  f.title nil
	end

end