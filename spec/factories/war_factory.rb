FactoryGirl.define do
  factory :war do
    name              "HORSE"
    has_end           true
    ending_date       { 1.month.from_now }
    ending_score      2
    booty             false
    open_registration false
  end
end
