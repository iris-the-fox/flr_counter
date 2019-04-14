class Review < ApplicationRecord
  belongs_to :story
  before_save :add_link_and_author

  private
    def add_link_and_author
    	msg = Review_finder.new(self.text)
    	self.link = msg.link
    	self.author = msg.author
    end
end
