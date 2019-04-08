class CreateFlrs < ActiveRecord::Migration[5.2]
  def change
    create_table :flrs do |t|
      t.float :number
      t.date :start_date
      t.string :info
      t.string :link

      t.timestamps
    end
  end
end
