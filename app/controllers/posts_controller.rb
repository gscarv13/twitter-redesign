class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all
    @post = Post.new
    @to_follow = User.all.where.not(followed: current_user)
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      flash[:notice] = 'Posted!'
    else
      flash[:notice] = 'Something went wrong, please try again'
    end
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:text)
  end
end
