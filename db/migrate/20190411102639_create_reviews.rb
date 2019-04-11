class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :story, foreign_key: true
      t.text :text
      t.string :link
      t.string :author

      t.timestamps
    end
  end
end
