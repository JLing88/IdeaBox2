require 'rails_helper'

describe 'As an admin' do
  context 'they visit the category index page' do
    context 'they click delete' do
      it 'should delete the category' do
        admin = User.create(username: "Jesse", password: "test", role: 1)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

        category_1 = Category.create(title: "Category 1")
        category_2 = Category.create(title: "Category 2")

        visit admin_categories_path

        within("#category-#{category_1.id}") do
          click_on "Delete"
        end

        expect(page).to_not have_content(category_1.title)
        expect(current_path).to eq(admin_categories_path)
        expect(page).to have_content(category_2.title)
      end
    end
  end
end
