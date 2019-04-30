class AddLastUpdateToGroup < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :last_update, :string
  end
end
