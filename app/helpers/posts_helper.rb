module PostsHelper

  def display_icon(icon_class)
    user_signed_in? ? icon_class : 'fa-lock'
  end

  def owner?(post)
    current_user == post.user
  end

  def profile_picture
    user_signed_in? ? '/smiley.png' : '/spy.png'
  end
end
