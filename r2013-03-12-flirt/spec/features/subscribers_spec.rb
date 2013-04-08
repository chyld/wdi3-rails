require 'spec_helper'
require 'features/shared/login_helper'
include LoginHelper

describe 'Subscribers' do
  before(:each) do
    ['Free', 'Basic'].each do |name|
      FactoryGirl.create(:subscription, plan: name)
    end
  end

  describe 'GET /' do
    it 'displays register link' do
      visit root_path
      page.should have_link('Register')
    end
  end

  describe 'POST /login' do
    it 'the subscriber can view a list of subscriptions', :js => true do
      subscriber = FactoryGirl.create(:subscriber_no_subscription)
      login_to_system(subscriber.user)
      page.should have_button('Free')
      visit root_path
      page.should have_button('Basic')
    end
    it 'the subscriber does not see a list of subscriptions', :js => true do
      subscriber = FactoryGirl.create(:subscriber_with_subscription)
      login_to_system(subscriber.user)
      page.should_not have_button('Free')
      visit root_path
      page.should_not have_button('Basic')
    end
    it 'the admin does not see a list of subscriptions', :js => true do
      admin = FactoryGirl.create(:administrator)
      login_to_system(admin.user)
      page.should_not have_button('Free')
      visit root_path
      page.should_not have_button('Basic')
    end
  end

  describe 'GET /subscribers/new' do
    it 'displays the new user form', :js => true do
      visit root_path
      click_link('Register')
      page.should have_button('Create User')
    end
  end

  describe 'POST /subscribers' do
    it 'creates a new subscriber', :js => true do
      visit root_path
      click_link('Register')
      fill_in('Username', :with => 'Bob')
      fill_in('Email', :with => 'bob@gmail.com')
      fill_in('user_password', :with => 'a')
      fill_in('user_password_confirmation', :with => 'a')
      click_button('Create User')
      page.should_not have_button('Create User')
      expect(Subscriber.first.user.username).to eq 'Bob'
    end
    it 'does not create a new subscriber due to failing validation', :js => true do
      visit root_path
      click_link('Register')
      click_button('Create User')
      page.should have_button('Create User')
      page.should have_css('#form ol li', :count => 3)
      page.should have_text('Fix the following 3 errors:')
    end
  end

  describe 'POST /subscribers/purchase' do
    it 'purchases a subscription for a subscriber', :js => true do
      subscriber = FactoryGirl.create(:subscriber_no_subscription)
      login_to_system(subscriber.user)
      click_button('Basic')
      page.should_not have_button('Basic')
      page.should have_link('Profile')
    end
  end

  describe 'JS cancel_subscriber_form()' do
    it 'removes the subscriber form', :js => true do
      visit root_path
      click_link('Register')
      click_link('Cancel')
      page.should_not have_button('Create User')
    end
  end
end
