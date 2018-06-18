class JobForm
  include ActiveModel::Model

  attr_accessor :title, :id

  validates :title, presence: true

  def create
    if valid?
      Job.create!(title: title)
      true
    else
      false
    end
  end
end
