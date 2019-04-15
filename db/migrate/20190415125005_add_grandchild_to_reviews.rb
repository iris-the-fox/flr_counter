class AddGrandchildToReviews < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :group, foreign_key: true
  end
end
