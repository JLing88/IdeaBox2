class Admin::ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.create(image_params)
    if @image.save
      redirect_to admin_images_path
    else
      render :new
    end
  end

  private

  def image_params
    params.require(:image).permit(:title, :url)
  end
end
