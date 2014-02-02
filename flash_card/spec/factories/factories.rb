FactoryGirl.define do
  factory :card do
    sequence(:question)  { |n| "question #{n}" }
    sequence(:answer) { |n| "answer #{n}"}
  end

  factory :deck do
    sequence(:name)  { |n| "deck #{n}" }
  end

  factory :user do
  	sequence(:name) { |n| "user#{n}" }
  	password "foobar"
  end
end