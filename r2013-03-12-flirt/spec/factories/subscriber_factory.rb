FactoryGirl.define do
  factory :subscriber_no_subscription, class: Subscriber do
    tagline 'Walk in the park'
    bio     'I enjoy walks in the park'
    gender  'Female'
    age     18
    user    {FactoryGirl.create(:regular_user)}
  end

  factory :subscriber_with_subscription, class: Subscriber do
    tagline       'Surfer gal'
    bio           'I love swimming'
    gender        'Female'
    age           19
    user          {FactoryGirl.create(:regular_user)}
    subscription  {FactoryGirl.create(:subscription)}
  end
end
