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
end
