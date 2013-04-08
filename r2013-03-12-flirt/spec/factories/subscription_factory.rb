FactoryGirl.define do
  factory :subscription, class: Subscription do
    plan        'Basic'
    duration    1
  end
end
