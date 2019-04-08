class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.integer :number
      t.string :name
      t.string :color

      t.timestamps
    end
  end
end
