module ResourcesHelper
  def get_resource_class resource = nil
    if resource
      resource.class 
    else
      resource_class
    end
  end

  def get_associations resource
    get_resource_class(resource).reflections.map { |reflection| reflection.first }
  end

  def accessible_attributes resource = nil
    attributes = get_resource_class(resource).accessible_attributes.dup

    attributes || []
  end

  #You can read any attribute, just not _id fields
  def readable_attributes resource = nil
    accessible_attributes(resource).delete_if { |attribute| attribute =~ /(_attributes)|(_id)|(_ids)$/ }
  end

  #You can write any attribute, except for models
  def writable_attributes resource = nil
    attrs = accessible_attributes(resource).delete_if { |attribute| attribute =~ /(_attributes)$/ }
    attrs -=  get_associations(resource)
  end

  def resource_name resource = nil
    (resource) ? resource.class.model_name.titleize : resource_class.model_name.titleize
  end
end