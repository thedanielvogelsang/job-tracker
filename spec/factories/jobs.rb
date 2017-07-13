FactoryGirl.define do
  factory :job do
    title "Clean Toilets"
    description "Clean all the toilets on the main Lodge floor"
    level_of_interest 48
    city "Denver"

    association :company
  end
end
