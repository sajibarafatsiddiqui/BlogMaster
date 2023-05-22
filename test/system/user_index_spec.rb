require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  describe 'GET /users' do
    let!(:user1) { create(:user, name: 'Tom', postscounter: 3) }
    let!(:user2) { create(:user, name: 'sasas', postscounter: 3) }
    before do
      visit users_path
    end
    it 'displays all users' do
      expect(page).to have_content('List of All Users')
      expect(page).to have_content(user1.name)
      expect(page).to have_css("img[src*='#{user1.photo}']")
    end

    it 'click link' do
      click_link(user1.name)
      expect(current_path).to eq(user_path(user1))
    end
  end
end
