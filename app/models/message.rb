class Message < ApplicationRecord
  belongs_to :page
  validates_uniqueness_of :body
  validates_presence_of :body
end
