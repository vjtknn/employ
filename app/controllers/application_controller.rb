class ApplicationController < ActionController::Base
  include Pundit

  def current_user
    super || Guest.new
  end
end
