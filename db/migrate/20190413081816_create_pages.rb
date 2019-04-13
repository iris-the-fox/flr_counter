class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.string :body
      t.integer :number
      t.references :flr, foreign_key: true

      t.timestamps
    end
  end
end
