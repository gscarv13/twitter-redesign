module ApplicationHelper
  def nav_edit_button
    return unless user_signed_in?

    link_to edit_user_registration_path do
      '<span class="iconify" data-icon="clarity:settings-solid" data-inline="false"></span>'.html_safe
    end
  end

  def nav_sign_out_button
    return unless user_signed_in?

    link_to destroy_user_session_path, method: :delete do
      '<span class="iconify" data-icon="codicon:sign-out" data-inline="false"></span>'.html_safe
    end
  end
end
