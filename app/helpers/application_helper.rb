module ApplicationHelper

  def nav_link(link_text, link_path)
    class_name = current_page?(link_path) ? 'active' : ''

    content_tag(:li, class: class_name) do
      link_to link_path do
        "<i class=\"fa fa-th-large\"></i> #{link_text}".html_safe
      end
    end
  end

  def is_index?
    current_page? root_path
  end

  def is_index_with_categories?
    current_page?(controller: 'client/events', action: :index)
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

  def resource_class
    @devise_mapping.to
  end

  def convert_to_currency(money)
    number_to_currency(money, unit: '฿')
  end
end
