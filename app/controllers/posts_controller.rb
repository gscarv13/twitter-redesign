class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index]

  def index
    @posts = Post.all
    @post = Post.new
  end

  def create
    @post = Post.new
  end
end
