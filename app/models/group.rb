class Group < ApplicationRecord
	validates :number, :color, :name, presence: true
	validates :number, :color, :name, uniqueness: true

end
