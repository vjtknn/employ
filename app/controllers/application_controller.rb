class ApplicationController < ActionController::Base
  include Pundit

  def current_user
    super || Guest
  end
end
