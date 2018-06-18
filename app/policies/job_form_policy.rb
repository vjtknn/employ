class JobFormPolicy < ApplicationPolicy

  def new?
    true
  end

  def create?
    admin?
  end

  def update?
    admin?
  end
end
