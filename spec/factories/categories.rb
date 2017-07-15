FactoryGirl.define do
  factory :category do
    sequence :title, ["A", "BB", "CCC"].cycle do |n|
      "CorporateHegemon = #{n}"
    end
  end
end
