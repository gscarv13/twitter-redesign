class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.where(id: current_user).includes(:followers, :followed)
    @posts = Post.all.order('created_at DESC')
    @post = Post.new
    @to_follow = User.all.where.not(followed: current_user).includes(:followed)
  end

  def create
    @post = current_user.posts.build(post_params)

    flash[:notice] = @post.save ? 'Posted!' : 'Something went wrong, please try again'
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:text)
  end
end
