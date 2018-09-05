require 'rails_helper'

describe 'As a logged in user' do
  context "they login and visit user_ideas_path" do
    context "they click on Create an Idea and fill in the form" do
      it 'should show the new idea' do
        user = User.create(username: "Jesse", password: "test")

        visit user_ideas_path(user)

        click_on "Create an Idea"

        expect(current_path).to eq(new_user_idea_path(user))

        fill_in :idea_title, with: "New Title"
        fill_in :idea_body, with: "New Body"
        click_on "Create Idea"

        idea = Idea.last

        expect(current_path).to eq(user_idea_path(user, idea))
        expect(page).to have_content("New Title")
        expect(page).to have_content("New Body")
      end
    end
  end
end
