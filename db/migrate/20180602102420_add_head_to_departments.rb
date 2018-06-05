class AddHeadToDepartments < ActiveRecord::Migration[5.2]
  def change
    add_reference :departments, :head, foreign_key: { to_table: :employees}
  end
end
