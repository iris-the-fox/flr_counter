class Story < ApplicationRecord
  belongs_to :group
  default_scope {order :name}

end
