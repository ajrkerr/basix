class ApplicationController < ActionController::Base
  protect_from_forgery

  respond_to :html

  before_filter :_reload_libs, :if => :_reload_libs? #For development
  before_filter :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    flash.now[:warning] = "You do not have permissions to do that"
    redirect_to root_url
  end

  private

  def _reload_libs
    RELOAD_LIBS.each do |lib|
      require_dependency lib
    end
  end

  def _reload_libs?
    defined? RELOAD_LIBS
  end

  def authenticate_inviter!
    can?(:invite, User) and super
  end
end
