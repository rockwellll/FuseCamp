require 'action_text'
require 'hotwire-rails'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # importing them because of testing engine
  helper ActionText::Engine.helpers
  helper Turbo::FramesHelper
  helper Turbo::StreamsHelper

  set_current_tenant_through_filter
  def set_tenant
    set_current_tenant current_user
  end
end
