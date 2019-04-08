class AddFlrToGroups < ActiveRecord::Migration[5.2]
  def change
    add_reference :groups, :flr, foreign_key: true
  end
end
