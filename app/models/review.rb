class Review < ApplicationRecord
  belongs_to :story
  before_save :add_link_and_author, if: :new_record?

  private
    def add_link_and_author
    	text = self.text.gsub( /\n/, "" ).gsub( /\r/, "" )
    	msg = Review_finder.new(text)
    	self.link = msg.link
    	self.author = msg.author
    end
end
