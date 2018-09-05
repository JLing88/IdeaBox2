require 'rails_helper'

describe 'user can delete an idea' do
  context 'they visit the show page' do
    context 'they click delete' do
      it 'takes them back to the index page and that idea is gone' do
        user = User.create(username: "Jesse", password: "test")
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        category = Category.create(title: "Category 1")
        idea_1 = user.ideas.create(title: "Title 1", body: "Body 1", category_id: category.id)
        idea_2 = user.ideas.create(title: "Title 2", body: "Body 2", category_id: category.id)

        visit user_idea_path(user, idea_1)
        click_on "Delete"

        expect(page).to have_content("Title 2")
        expect(page).to have_content("Body 2")
        expect(page).to_not have_content("Title 1")
        expect(page).to_not have_content("Body 1")
      end
    end
  end
end
