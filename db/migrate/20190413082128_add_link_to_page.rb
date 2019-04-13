class AddLinkToPage < ActiveRecord::Migration[5.2]
  def change
    add_column :pages, :link, :string
  end
end
