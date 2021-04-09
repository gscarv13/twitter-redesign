module UsersHelper
  def follow_buttons
    if current_user.followers.where(followed: @user).pluck(:followed_id).any?
      link_to user_unfollow_path(@user) do
        '<span class="iconify" data-icon="ic:outline-cancel" data-inline="false"></span>'.html_safe
      end
    else
      link_to user_follow_path(@user) do
        '<span class="iconify" data-icon="akar-icons:circle-plus" data-inline="false"></span>'.html_safe
      end
    end
  end
end
