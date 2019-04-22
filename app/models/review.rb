# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :story
  default_scope { order :created_at }
  before_save :add_link_and_author, if: :new_record?
  belongs_to :group

  private

  def add_link_and_author
    text = self.text.delete("\n").delete("\r").delete(' ')
    msg = Review_finder.new(text)
    self.link = msg.link
    self.author = msg.author
  end
end
