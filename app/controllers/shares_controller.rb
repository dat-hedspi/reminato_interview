class SharesController < ApplicationController
  before_action :authenticate_user!

  def index
    @post = Post.new
  end

  def edit
    @post = Post.find_by(id: params[:id])
    unless @post
      redirect_to root_path
      flash[:danger] = "Post not found"
    end
  end
end
