class Admin::CategoriesController < ApplicationController
 def index
   if current_admin?
     @categories = Category.all
   else
     render file: '/public/404.html'
   end
 end

 def destroy
   Category.destroy(params[:id])
   redirect_to admin_categories_path
 end

 def new
   @category = Category.new
 end

 def create
   @category = Category.create(category_params)
   if @category.save
     redirect_to admin_categories_path
   else
     render :new
   end
 end

 private

 def category_params
   params.require(:category).permit(:title)
 end
end
