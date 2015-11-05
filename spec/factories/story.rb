FactoryGirl.define do
  factory :story do
    sequence :title do |n|
      "Story ##{n}"
    end

    sequence :narrative do |n|
      "Twas the #{n}th dark and story night"
    end
  end
end
