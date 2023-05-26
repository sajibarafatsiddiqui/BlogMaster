class ApplicationController < ActionController::API
  def current_user
    User.find(6)
  end
end
