class Group < ApplicationRecord
	validates :number, :color, :name, presence: true
	validates :number, :color, :name, uniqueness: true
	belongs_to :flr, dependent: :nullify
	belongs_to :user, dependent: :nullify

end
