class LikesController < ApplicationController
  def new
    @user = current_user
    @post = Post.find(params[:post_id])
    @like = Like.new
  end

  def create
    @current_user = current_user
    @post = Post.find(params[:post_id])
    @like = Like.create!(user: @current_user, post: @post)
    @post_user = User.find(params[:user_id])

    redirect_to user_post_path(@post_user, @post), notice: 'Post liked'
  end
end
