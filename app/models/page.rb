class Page < ApplicationRecord
  belongs_to :flr
  # validates_uniqueness_of :body
  # validates_presence_of :body
  default_scope {order :number}
  has_many :messages, dependent: :destroy
end
