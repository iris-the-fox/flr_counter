class AddRawBodyToMessage < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :raw_body, :text
  end
end
