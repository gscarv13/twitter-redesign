module UsersHelper
  def follow_buttons(user)
    if current_user.followers.pluck(:followed_id).include?(user.id)
      link_to user_unfollow_path(user) do
        '<span class="iconify mx-3" data-icon="ic:outline-cancel" data-inline="false"></span>'.html_safe
      end
    elsif user == current_user
      nil
    else
      link_to user_follow_path(user), class: 'mx-3' do
        '<span class="iconify" data-icon="akar-icons:circle-plus" data-inline="false"></span>'.html_safe
      end
    end
  end

  def user_photo(user, classes = 'profile-img mx-3')
    if user.photo.file.nil?
      img = 'https://res.cloudinary.com/sdcnwco/image/upload/v1618161614/prinny_ibxg3o.jpg'
      "<img src='#{img}' alt='default-avatar' class=#{classes}>".html_safe
    else
      "<img src='#{user.photo}' alt='' class=#{classes}>".html_safe
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

  def follow_suggestion(following_list, user)
    output = ''
    unless following_list.include?(user.id)
      output = "<div class='follow-suggestion is-flex py-5'>"
      output << user_photo(user)
      output << "<div class='follow-info'>"
      output << "<p><a class='mx-3' href='#{users_show_path(user)}'> #{user.full_name} </a></p></div></div>"
    end
    output.html_safe
  end
end
