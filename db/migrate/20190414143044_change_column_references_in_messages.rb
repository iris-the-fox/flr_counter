class ChangeColumnReferencesInMessages < ActiveRecord::Migration[5.2]
  def change
  	 remove_column :messages, :flr_id
  	 add_reference :messages, :page, foreign_key: true
  end
end
