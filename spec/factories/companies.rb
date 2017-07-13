FactoryGirl.define do
  factory :company do
    sequence :name do |i|
       "Uni-Lever#{i}"
     end
  end
end
