class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      flash[:notice] = 'Posted!'
      redirect_to root_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:text)
  end
end
