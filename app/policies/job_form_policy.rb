class JobFormPolicy < ApplicationPolicy

  def new?
    true
  end

  def create?
    admin?
  end

  def edit?
    true
  end

  def update?
    admin?
  end
end
