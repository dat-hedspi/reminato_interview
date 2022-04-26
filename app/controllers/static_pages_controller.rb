class StaticPagesController < ApplicationController
  def index
    @all_posts = Post.all.includes(:user).order_by_time(:desc)
  end
end
