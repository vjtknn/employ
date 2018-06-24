# == Schema Information
#
# Table name: jobs
#
#  id         :bigint(8)        not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Job < ApplicationRecord
  has_many :employees

  validates_presence_of :title
end
