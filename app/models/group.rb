class Group < ApplicationRecord
	validates :number, :color, :name, presence: true
	validates :number, :color, :name, uniqueness: true
	belongs_to :flr, dependent: :destroy
	belongs_to :user, dependent: :destroy

end
