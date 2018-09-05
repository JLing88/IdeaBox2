class IdeasController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @ideas = Idea.where(user_id: @user.id)
  end
end
