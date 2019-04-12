class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :body
      t.string :link
      t.string :author
      t.references :flr, foreign_key: true

      t.timestamps
    end
  end
end
