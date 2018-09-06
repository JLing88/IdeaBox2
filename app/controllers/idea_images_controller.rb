class IdeaImagesController < ApplicationController
  def new
    @idea_image = IdeaImage.new
    @images = Image.all
  end

  def create

    IdeaImage.create(idea_image_params)
    redirect_to user_idea_path(current_user, idea)
  end
end
