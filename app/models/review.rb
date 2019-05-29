# frozen_string_literal: true

class Review < ApplicationRecord
  include StopList
  belongs_to :story
  default_scope { order created_at: :desc }
  before_save :add_link_and_author, if: :new_record?
  belongs_to :group
  has_one :message

  private

  def add_link_and_author
    if text.present?
      text = delete_smiles(self.text)
      text = clean_text(text)
      puts text
      puts '==='
      msg = Review_finder.new(text)
      self.link = msg.link
      self.author = msg.author
      self.message = msg.msg
    end
  end
  
end
