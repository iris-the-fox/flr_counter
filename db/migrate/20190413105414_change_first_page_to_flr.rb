class ChangeFirstPageToFlr < ActiveRecord::Migration[5.2]
  def change
  	change_column :flrs, :first_page, 'integer USING CAST(first_page AS integer)'
  end
end
