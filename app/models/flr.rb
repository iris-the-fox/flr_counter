class Flr < ApplicationRecord
	validates_uniqueness_of :number

	has_many :groups
	has_many :messages, dependent: :destroy
	has_many :pages, dependent: :destroy

end
