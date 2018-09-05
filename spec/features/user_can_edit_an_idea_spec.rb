require 'rails_helper'

describe 'user can edit and idea' do
  context 'they visit the show page' do
    context 'they click on Edit and fill in the form' do
      it 'shows the updated idea' do
        user = User.create(username: "Jesse", password: "test")
        category = Category.create(title: "Category 1")
        idea_1 = user.ideas.create(title: "Title 1", body: "Body 1", category_id: category.id)

        visit user_idea_path(user, idea_1)

        click_on "Edit"

        expect(current_path).to eq(edit_user_idea_path(user, idea_1))
        fill_in :idea_title, with: "Updated Title"
        fill_in :idea_body, with: "Updated Body"
        click_on "Update Idea"

        expect(current_path).to eq(user_idea_path(user, idea_1))
        expect(page).to have_content("Updated Title")
        expect(page).to have_content("Updated Body")
      end
    end
  end
end
