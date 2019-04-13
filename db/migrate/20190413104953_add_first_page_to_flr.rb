class AddFirstPageToFlr < ActiveRecord::Migration[5.2]
  def change
    add_column :flrs, :first_page, :string
  end
end
