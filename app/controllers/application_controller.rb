require 'action_text'
require 'hotwire-rails'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  # importing them because of testing engine
  helper ActionText::Engine.helpers
  helper Turbo::FramesHelper
  helper Turbo::StreamsHelper

  set_current_tenant_through_filter
  def set_tenant
    set_current_tenant current_user
  end


  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :is_member])
  end
end
