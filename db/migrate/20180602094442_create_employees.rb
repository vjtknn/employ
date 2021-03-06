class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.datetime :birth_date, null: false
      t.references :job, foreign_key: true

      t.timestamps
    end
  end
end
