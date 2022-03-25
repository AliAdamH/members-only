module PostsHelper

  def display_icon(icon_class)
    user_signed_in? ? icon_class : 'fa-lock'
  end
end
