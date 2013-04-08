FactoryGirl.define do
  factory :generic_user, class: User do
    username              'generic'
    email                 'generic@gmail.com'
    password              'a'
    password_confirmation 'a'
  end

  factory :regular_user, class: User do
    username              'regular'
    email                 'regular@gmail.com'
    password              'a'
    password_confirmation 'a'
  end

  factory :admin_user, class: User do
    username              'admin'
    email                 'admin@gmail.com'
    password              'a'
    password_confirmation 'a'
  end
end
