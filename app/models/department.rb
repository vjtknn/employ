# == Schema Information
#
# Table name: departments
#
#  id                  :bigint(8)        not null, primary key
#  name                :string           not null
#  number_of_employees :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  head_id             :bigint(8)
#
# Indexes
#
#  index_departments_on_head_id  (head_id)
#
# Foreign Keys
#
#  fk_rails_...  (head_id => employees.id)
#

class Department < ApplicationRecord
end
