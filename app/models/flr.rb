class Flr < ApplicationRecord
	validates_uniqueness_of :number
	has_many :groups
end
