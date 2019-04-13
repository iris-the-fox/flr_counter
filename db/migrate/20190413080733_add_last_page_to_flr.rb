class AddLastPageToFlr < ActiveRecord::Migration[5.2]
  def change
    add_column :flrs, :last_page, :integer
  end
end
