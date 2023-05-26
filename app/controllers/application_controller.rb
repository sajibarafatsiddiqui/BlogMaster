require "application_responder"

class ApplicationController < ActionController::API
  self.responder = ApplicationResponder
  respond_to :html

  include ActionController::Helpers

  def current_user
    User.find(6)
  end

  helper_method :current_user
end
