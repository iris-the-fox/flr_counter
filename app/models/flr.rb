class Flr < ApplicationRecord
	validates_uniqueness_of :number
    default_scope {order :number}
	has_many :groups,  -> { joins(:flr).order('flrs.number') }

	has_many :pages, dependent: :destroy

end
