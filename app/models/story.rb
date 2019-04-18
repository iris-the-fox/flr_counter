class Story < ApplicationRecord
  belongs_to :group, optional: true
  default_scope {order :created_at}
  validates :name, presence: true
  validates :name, uniqueness: { scope: :group_id,
    message: ": Рассказ с таким названием уже существует" }
  has_many :reviews, dependent: :destroy
  accepts_nested_attributes_for :reviews, reject_if: :all_blank, allow_destroy: true

end
