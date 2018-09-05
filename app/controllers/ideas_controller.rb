class IdeasController < ApplicationController

  before_action :find_user

  def index
    @user = User.find(params[:user_id])
    @ideas = Idea.where(user_id: @user.id)
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = @user.ideas.create(idea_params)
    redirect_to user_idea_path(@user, @idea)
  end

  def show
    @idea = Idea.find(params[:id])
  end

  def destroy
    Idea.destroy(params[:id])
    redirect_to user_ideas_path(@user)
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :body)
  end

  def find_user
    @user = User.find(params[:user_id])
  end
end
