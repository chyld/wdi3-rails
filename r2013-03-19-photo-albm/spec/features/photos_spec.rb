require 'spec_helper'

describe 'Photos' do

  describe 'GET /photos/new' do
    it 'displays the Photo form', :js => true do
      album = FactoryGirl.create(:album)
      visit album_path(album)
      click_link('New Photo')
      page.should have_button('Create Photo')
    end
  end

  describe 'JS clear_form' do
    it 'clears the Photo form', :js => true do
      album = FactoryGirl.create(:album)
      visit album_path(album)
      click_link('New Photo')
      click_link('Cancel')
      page.should_not have_button('Create Photo')
    end
  end

end
