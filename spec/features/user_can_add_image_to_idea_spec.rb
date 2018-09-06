require 'rails_helper'

describe "As a user" do
  context 'they link from the idea show page' do
    context "they click Add Image and select an image" do
      it "shows the added image on the idea show page" do
        user = User.create(username: "Jesse", password: "test")
        category = Category.create(title: "Category")
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        idea_1 = user.ideas.create(title: "Title 1", body: "Body 1", category_id: category.id)
        idea_2 = user.ideas.create(title: "Title 2", body: "Body 2", category_id: category.id)
        image = Image.create!(title: "Beach", url: "https://images.pexels.com/photos/457882/pexels-photo-457882.jpeg?auto=compress&cs=tinysrgb&h=350")
        visit user_ideas_path(user)
        click_on "Title 1"
        expect(current_path).to eq(user_idea_path(user, idea_1))
        click_on "Add Image"

        click_on "Select"

        expect(current_path).to eq(user_idea_path(user, idea_1))
      end
    end
  end
end
