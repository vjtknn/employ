class JobFormPolicy < ApplicationPolicy

  def new?
    current_user.role == 'admin'
  end
end
