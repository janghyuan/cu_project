module ApplicationHelper
  def full_title(page_title='', base_title='China Union')
     if page_title.empty?
       base_title
     else
       page_title + ' | ' + base_title
     end
  end
  
  def gravatar_for user, options = {}
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size] || 36
    klass = options[:class] || ''
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?size=#{size}"
    image_tag(gravatar_url, alt: "#{user.name} avatar", class: "gravatar #{klass}")
  end
end
