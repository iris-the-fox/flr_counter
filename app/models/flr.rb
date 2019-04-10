class Flr < ApplicationRecord
	validates_uniqueness_of :number
	validates :current, uniqueness: { 
    message: ": Текущая ФЛР уже задана" }
	has_many :groups
end
