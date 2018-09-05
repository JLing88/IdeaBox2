require 'rails_helper'

describe "As an admin" do
  describe "they visit the categories index page" do
    context 'they click Create Category and fill in the form' do
      it 'redirects to Category index page showing newly created Category' do
        admin = User.create(username: "Jesse", password: "test", role: 1)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

        visit admin_categories_path
        click_on "Create New Category"

        expect(current_path).to eq(new_admin_category_path)
        fill_in 'category[title]', with: "New Category"
        click_on "Create Category"

        expect(current_path).to eq(admin_categories_path)
        expect(page).to have_content("New Category")
      end
    end
  end
end
