class AddBossToEmployees < ActiveRecord::Migration[5.2]
  def change
    add_reference :employees, :boss, foreign_key: { to_table: :employees }
  end
end
