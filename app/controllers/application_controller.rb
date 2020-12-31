class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  set_current_tenant_through_filter
  def set_tenant
    set_current_tenant current_user
  end
end
