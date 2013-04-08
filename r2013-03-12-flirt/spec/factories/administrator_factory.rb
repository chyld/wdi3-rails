FactoryGirl.define do
  factory :administrator, class: Administrator do
    role 'dba'
    user    {FactoryGirl.create(:admin_user)}
  end
end
