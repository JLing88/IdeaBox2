require 'rails_helper'

describe 'registration and login' do
  describe 'registration' do
    it 'allows a visitor to register' do
      username = 'testertest'

      visit root_path

      click_on 'Sign Up'

      expect(current_path).to eq(new_user_path)

      fill_in :user_username, with: username
      fill_in :user_password, with: "test"

      click_on "Create User"
      user = User.last
      expect(current_path).to eq(user_ideas_path(user))
      expect(page).to have_content("All Ideas for #{username}")

    end
  end
end
