# frozen_string_literal: true

class Page < ApplicationRecord
  belongs_to :flr
  # validates_uniqueness_of :body
  # validates_presence_of :body
  default_scope { order :number }
  has_many :messages, dependent: :destroy
  validate :page_is_normal

  def page_is_normal
    if body.include?('От вас приходит неприлично много одновременных обращений к сайту.')
      errors.add(:body, 'Сайт считает, что вы хотите его выкачать')
    end
  end
end
