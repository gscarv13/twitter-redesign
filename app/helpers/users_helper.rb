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

  def user_photo(user)
    if user.photo.file.nil?
      img = 'https://res.cloudinary.com/sdcnwco/image/upload/v1618161614/prinny_ibxg3o.jpg'
      "<img src='#{img}' alt='default-avatar' class='profile-img pr-3'>".html_safe
    else
      "<img src='#{user.photo}' alt='' class='profile-img pr-3'>".html_safe
    end
  end

  def cover_image(user)
    if user.cover_image.file.nil?
      img = 'https://res.cloudinary.com/sdcnwco/image/upload/v1618165441/3_ymbgau.jpg'
      "<img src='#{img}' alt='default-bg' class='cover-img'>".html_safe
    else
      "<img src='#{user.cover_image}' alt='' class='cover-img'>".html_safe
    end
  end
end
