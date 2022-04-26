class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: %w[update destroy]

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "You shared a movie"
      redirect_to root_path
    else
      flash.now[:danger] = "You shared fail"
      render "shares/index"
    end
  end

  def update
    if @post.update post_params
      flash[:success] = "Movie updated successful"
      redirect_to root_path
    else
      flash.now[:danger] = "You shared fail"
      render "shares/edit"
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "Movie deleted"
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:link_youtube, :description)
  end

  def find_post
    @post = current_user.posts.find_by(id: params[:id])
    unless @post
      redirect_to root_path
      flash[:danger] = "Post not found"
    end
  end
end
