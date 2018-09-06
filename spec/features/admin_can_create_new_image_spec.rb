require 'rails_helper'

describe 'As an admin' do
  context 'they link from the image index page' do
    context 'they fill in the form and click Submit' do
      it "shows the newly created image" do
        admin = User.create(username: "Jesse", password: "test", role: 1)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

        visit admin_images_path

        click_on "Create New Image"
        expect(current_path).to eq(new_admin_image_path)
        fill_in "image[url]", with: "https://images.pexels.com/photos/248797/pexels-photo-248797.jpeg?auto=compress&cs=tinysrgb&h=350"
        fill_in "image[title]", with: "Beach"
        click_on "Create Image"

        expect(current_path).to eq(admin_images_path)
        expect(page).to have_content("Beach")
        save_and_open_page

      end
    end
  end
end
