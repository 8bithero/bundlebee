module ApplicationHelper
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "BundleBee").join(" - ") unless parts.empty?
      end
    end
  end

  def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
