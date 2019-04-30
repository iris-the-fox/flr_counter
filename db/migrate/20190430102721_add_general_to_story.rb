class AddGeneralToStory < ActiveRecord::Migration[5.2]
  def change
    add_column :stories, :general, :boolean, default: false
  end
end
