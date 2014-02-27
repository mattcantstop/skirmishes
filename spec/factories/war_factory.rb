FactoryGirl.define do
  factory :war do
    name              "HORSE"
    has_end           true
    ending_date       Time.now + 1.month
    ending_score      2
    booty             false
    open_registration false
  end
end
