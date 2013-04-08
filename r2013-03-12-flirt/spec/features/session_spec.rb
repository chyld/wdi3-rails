require 'spec_helper'
require 'features/shared/login_helper'
include LoginHelper

describe 'Session' do
  before(:each) do
    ['Free', 'Basic'].each do |name|
      FactoryGirl.create(:subscription, plan: name)
    end
  end

  describe 'GET /' do
    it 'displays login link' do
      visit root_path
      page.should have_link('Login')
    end
  end

  describe 'GET /login' do
    it 'displays the login form', :js => true do
      visit root_path
      click_link('Login')
      page.should have_button('Start Flirting')
    end
  end

  describe 'POST /login' do
    let(:user) {FactoryGirl.create(:generic_user)}

    it 'logs the user into the system if credentials are correct', :js => true do
      login_to_system(user)
      page.should_not have_button('Start Flirting')
      expect(page.has_link?(user.username)).to be true
      page.should_not have_link('Register')
      visit root_path
      expect(page.has_link?(user.username)).to be true
      page.should_not have_link('Login')
    end
    it 'does not log the user into the system if credentials are incorrect', :js => true do
      visit root_path
      click_link('Login')
      fill_in('Email', :with => user.email)
      fill_in('Password', :with => 'b')
      click_button('Start Flirting')
      page.should have_button('Start Flirting')
    end
  end

  describe 'DELETE /login' do
    it 'logs the user off the system', :js => true do
      subscriber = FactoryGirl.create(:subscriber_no_subscription)
      login_to_system(subscriber.user)
      click_link(subscriber.user.username)
      expect(page.has_link?(subscriber.user.username)).to be false
      page.should have_link('Register')
      page.should_not have_button('Free')
      visit root_path
      expect(page.has_link?(subscriber.user.username)).to be false
      page.should have_link('Login')
      page.should_not have_button('Basic')
    end
  end

  describe 'JS cancel_login_form()' do
    it 'removes the login form', :js => true do
      visit root_path
      click_link('Login')
      click_link('Cancel')
      page.should_not have_button('Start Flirting')
    end
  end
end
