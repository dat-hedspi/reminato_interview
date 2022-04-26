class StaticPagesController < ApplicationController
  def index
    @all_posts = Post.all.includes(:user).order_by_time(:desc).paginate(page: params[:page], per_page: 5)
  end
end
