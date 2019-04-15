class Review < ApplicationRecord
  belongs_to :story
  before_save :add_link_and_author, if: :new_record?
  belongs_to :group, optional: true

  private
    def add_link_and_author
    	text = self.text.gsub( /\n/, "" ).gsub( /\r/, "" ).gsub(" ", "" )
    	msg = Review_finder.new(text)
    	self.link = msg.link
    	self.author = msg.author
    end
end
