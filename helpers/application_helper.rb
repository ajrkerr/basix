module ApplicationHelper
  
  def google_font_link_tag *families
    families.map do |family|
      tag('link', {:rel => :stylesheet, :type => Mime::CSS, :href => "https://fonts.googleapis.com/css?family=#{family}"}, false, false)
    end.join
  end

  def attr_value resource, attribute = nil
    if attribute
      value = resource.send(attribute)
    else
      value = resource
    end

    if value.is_a? ActiveRecord::Base and value.respond_to?(:name)
      if route_exists(value)
        link_to(value.name, value)
      else
        value.name
      end
    elsif attribute == 'name' and route_exists(resource)
      link_to value, resource
    elsif value.is_a? Array
      value.map { |item| attr_value(item).html_safe }.join(", ").html_safe
    elsif value.is_a? TrueClass
      "True"
    elsif value.is_a? FalseClass
      "False"
    elsif value.nil?
      "---"
    else
      value
    end
  end

  def attr_tag attribute, value
    render :partial => 'shared/attr_tag', :locals => { :attribute => attribute, :value => value }
  end

  def render_errors model
    flash.now[:error] = model.errors.full_messages.to_sentence if model.errors.count > 0
  end

  def render_dropdown options, &block
    options.merge!({ 
      :content => capture(&block)
    })

    render :partial => 'shared/dropdown', :locals => options
  end

  def nav_page_class page = nil
    controller_name = controller.controller_name

    if page.is_a? Array
      page.map!(&:to_s)
      "active" if page.include? controller_name
    elsif controller.controller_name == page.to_s
      "active"
    end
  end

  def date_format
    I18n.t 'date.formats.format'
  end

  def edit_link url
    render :partial => 'shared/edit_link', :locals => { :url => url }
  end

  def show_link url
    render :partial => 'shared/show_link', :locals => { :url => url }
  end

  def model_to_select resource
    resourc.einject({}) do |hsh, item|
      hsh[item.id] = item.name
    end
  end

  def role_only(rolename, resource = nil, &block)
    if not current_user.blank? and current_user.has_role?(rolename, resource)
      block.call
    end
  end

  def zucora_only &block
    role_only :ccr, &block
  end

  def admin_only &block
    role_only :admin, &block
  end

  def retail_manager_only retailer = nil, &block
    role_only [:retail_manager, :admin], retailer, &block
  end

  def route_exists object
    begin
      Rails.application.routes.recognize_path(url_for(object))
      return true
    rescue ActionController::RoutingError
      return false
    end
  end
end
