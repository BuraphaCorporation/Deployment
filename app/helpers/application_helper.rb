module ApplicationHelper
  def mobile_device?
    !request.user_agent.downcase.match(/iphone|android/).nil?
  end

  def render_field(field, locals = {})
    locals.merge!(field: field)
    render locals: locals, partial: field.to_partial_path
  end

  def display_resource_name(resource_name)
    resource_name.
      to_s.
      classify.
      constantize.
      model_name.
      human(
        count: 0,
        default: resource_name.to_s.pluralize.titleize,
      )
  end

  def svg_tag(asset, svg_id, options = {})
    svg_attributes = {
      "xlink:href".freeze => "#{asset_url(asset)}##{svg_id}",
      height: options[:height],
      width: options[:width],
    }.delete_if { |_key, value| value.nil? }
    xml_attributes = {
      "xmlns".freeze => "http://www.w3.org/2000/svg".freeze,
      "xmlns:xlink".freeze => "http://www.w3.org/1999/xlink".freeze,
    }

    content_tag :svg, xml_attributes do
      content_tag :use, nil, svg_attributes
    end
  end

  def sanitized_order_params
    params.permit(:search, :id, :order, :page, :per_page, :direction)
  end

  def nav_link(link_text, link_path)
    class_name = current_page?(link_path) ? 'active' : ''

    content_tag(:li, class: class_name) do
      link_to link_path do
        "<i class=\"fa fa-th-large\"></i> #{link_text}".html_safe
      end
    end
  end

  def top_nav_link(link_text, link_path, link_id)
    class_name = current_page?(link_path) ? 'active' : ''

    content_tag(:li, class: class_name, id: link_id) do
      link_to link_text, link_path
    end
  end

  def organizer_nav_link(link_text, link_path, link_id, link_icon)
   class_name = current_page?(link_path) ? "#{link_id} active" : link_id

   content_tag(:li, class: class_name) do
      link_to link_path do
        "<i class=\"icon icon-xs #{link_icon}\"></i> #{link_text}".html_safe
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
    if money.to_i == 0
      "ฟรี"
    else
      number_to_currency(money, unit: '฿', precision: 0)
    end
  end
end
