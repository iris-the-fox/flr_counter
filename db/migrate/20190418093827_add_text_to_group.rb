class AddTextToGroup < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :mot_text, :text
  end
end
