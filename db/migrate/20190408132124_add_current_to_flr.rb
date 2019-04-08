class AddCurrentToFlr < ActiveRecord::Migration[5.2]
  def change
    add_column :flrs, :current, :boolean, default: false
  end
end
