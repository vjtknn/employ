class JobForm
  include ActiveModel::Model

  attr_accessor :title

  validates :title, presence: true

  def save
    if valid?
      persist!
      true
    else
      false
    end
  end

  private

  def persist!
    @job = Job.create!(title: title)
  end
end
