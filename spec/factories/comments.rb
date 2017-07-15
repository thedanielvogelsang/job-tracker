FactoryGirl.define do
  factory :comment do
    content "MyString"
    association :job
  end
end
