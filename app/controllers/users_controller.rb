class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order('created_at DESC')
  end

  def follow
    @user = User.find(params[:id])
    @follow = current_user.followers.build(followed: @user)

    if @follow.save
      flash[:notice] = 'Following dood!'
    else
      flash[:alert] = 'Something went wrong... dood'
    end

    redirect_to users_show_path(@user)
  end

  def unfollow
    @user = User.find(params[:id])
    @follow = Following.find_by(followed: @user, follower: current_user)

    unless @follow.nil?
      @follow.destroy
      flash[:notice] = 'Not a follower anymore dood!'
    end

    redirect_to users_show_path(@user)
  end
end
