FactoryGirl.define do
  factory :job do
    sequence :title do |i|
      "Clean Toilets-#{i}"
    end
    description "Clean all the toilets on the main Lodge floor"
    level_of_interest 48
    city "Denver"

    association :company
    association :category
  end
end
