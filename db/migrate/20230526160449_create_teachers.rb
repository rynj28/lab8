class CreateTeachers < ActiveRecord::Migration[7.0]
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :department
      t.integer :unit

      t.timestamps
    end
  end
end
