class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user, only: %w[show following followers]

  def index
    @users = User.search_by_name(params[:search]).paginate(page: params[:page])
  end

  def show
    @posts = @user.posts.paginate(page: params[:page])
  end

  def following
    @title = "Following"
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private
  def find_user
    @user = User.find_by(id: params[:id])
    unless @user
      redirect_to root_path
      flash[:danger] = "User not found"
    end
  end
end
