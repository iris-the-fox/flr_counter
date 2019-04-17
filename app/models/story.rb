class Story < ApplicationRecord
  belongs_to :group, optional: true
  default_scope {order :name}
  validates :name, presence: true
  validates :name, uniqueness: {
    message: ": Рассказ с таким названием уже существует" }
  has_many :reviews, dependent: :destroy
  accepts_nested_attributes_for :reviews, reject_if: :all_blank

end
