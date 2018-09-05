class IdeasController < ApplicationController

  before_action :find_user
  before_action :find_idea, only: [:show, :update, :edit]

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
  end

  def destroy
    Idea.destroy(params[:id])
    redirect_to user_ideas_path(@user)
  end

  def edit
  end

  def update
    Idea.update(idea_params)
    redirect_to user_idea_path(@user, @idea)
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :body)
  end

  def find_idea
    @idea = Idea.find(params[:id])
  end

  def find_user
    @user = User.find(params[:user_id])
  end
end
