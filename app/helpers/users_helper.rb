module UsersHelper
  def gravatar_for user, size: 80
    if user.id != 1
      gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
      gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
      image_tag(gravatar_url, alt: user.name, class: "gravatar")
    else
      image_tag("users/avatar.png", size: "200x200", alt: user.name, class: "gravatar")
    end
  end
end
