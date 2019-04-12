class Message < ApplicationRecord
  belongs_to :flr
  validates_uniqueness_of :body
end
