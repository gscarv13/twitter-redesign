module UsersHelper
  def follow_buttons(user)
    if current_user.followers.pluck(:followed_id).include?(user.id)
      link_to user_unfollow_path(user) do
        '<span class="iconify" data-icon="ic:outline-cancel" data-inline="false"></span>'.html_safe
      end
    else
      link_to user_follow_path(user) do
        '<span class="iconify" data-icon="akar-icons:circle-plus" data-inline="false"></span>'.html_safe
      end
    end
  end
end
