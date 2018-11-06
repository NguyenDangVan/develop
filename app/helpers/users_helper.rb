module UsersHelper
  def gravatar_for user, options = {size: 100}
    if user.id != 1
      gravatar_id = Digest::MD5::hexdigest user.email.downcase
      size = options[:size]
      gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
      image_tag(gravatar_url, alt: user.name, class: "gravatar")
    else
      size = options[:size]
      image_tag "users/avatar.png", alt: user.name, class: "gravatar", size: "#{size}x#{size}"
    end
  end
end
