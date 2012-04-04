class ResourceController < ApplicationController
  include ApplicationHelper
  include InheritedResources::DSL

  inherit_resources
  check_authorization #Ensure authorization happens

  custom_actions :collection => :search
  
  before_filter :authorize_resource, :only => [:show, :edit, :destroy, :update]
  before_filter :authorize_collection, :only => [:index, :new, :create, :search]

  before_filter :_back_url, :only => [:index, :edit, :new, :show]

  respond_to :html, :json

  #Inherited resources, display validation error messages
  create! do |success, failure|
    set_validation_errors resource if failure.is_a? Collector
  end

  update! do |success, failure|
    set_validation_errors resource if failure.is_a? Collector
  end

  def destroy
    raise "The destroy action is disabled for this object"
  end

  def authorize_resource
    authorize! params[:action].to_sym, resource || resource_class
  end

  def authorize_collection
    authorize! params[:action].to_sym, resource_class
  end

private
  def set_validation_errors resource
    flash[:error] = "Validation Error: #{resource.errors.full_messages.join(", ")}"
  end

  #Add pagination by default to any resource requests
  def end_of_association_chain
    if !params[:search].nil? and resource_class.respond_to?(:search)
      super.search(params[:search])
    else
      super
    end.accessible_by(current_ability).page(params[:page])
  end

  def resource?
    begin
      resource
    rescue ActiveRecord::RecordNotFound
      nil
    end
  end

  def collection?
    collection
  end

  def _back_url
    @back_url = if action_name != 'show' and resource?
        resource_url 
      elsif action_name != 'index' and collection?
        collection_url
      elsif parent?
        parent_url
      else
        root_url
      end
  end
end
