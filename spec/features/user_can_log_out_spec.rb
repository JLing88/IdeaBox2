require 'rails_helper'

describe 'logged in user can log out' do
  describe 'they click Log Out from the nav bar' do
    it 'logs the user out of the application' do
      user = User.create(username: "Jesse", password: "test")

      visit login_path

      expect(current_path).to eq(login_path)

      fill_in :username, with: "Jesse"
      fill_in :password, with: "test"

      click_on "Log In"
      expect(page).to have_content("I already have an account")
      click_on "Log Out"

      expect(current_path).to eq(root_path)
      expect(@current_user).to eq(nil)
    end
  end
end
