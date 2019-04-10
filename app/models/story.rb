class Story < ApplicationRecord
  belongs_to :group, optional: true
  default_scope {order :name}
  validates :name, presence: true
  validates :name, uniqueness: {
    message: ": Рассказ с таким названием уже существует" }

end
