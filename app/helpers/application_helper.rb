module ApplicationHelper
  def current_user?(user)
    user && user == current_user
  end

  def gravatar_for(user, options = { size: 80 }, class_name = 'img-xs rounded-circle')
    size = options[:size]
    gravatar_id = Digest::MD5::hexdigest(user.name.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: class_name)
  end
end
