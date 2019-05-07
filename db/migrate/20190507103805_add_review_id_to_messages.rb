class AddReviewIdToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :review_id, :integer
  end
end
