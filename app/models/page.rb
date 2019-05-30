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

  def all_messages
    set = MessageArrayWS.new(self.body).review_arr
    set.each do |review|
      @message = self.messages.new(raw_body: review.raw_body,
                                    body: review.body,
                                    link: review.link,
                                    author: review.author)
      @message.save
    end
  end

end
