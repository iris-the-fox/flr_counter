# frozen_string_literal: true

class Review_finder

  attr_accessor :link, :author
  def initialize(shred)
    msg = Message.find_by('body like ?', "%#{shred}%")
    if msg
      @link = msg.link
      @author = msg.author
    else
      @link = nil
      @author = nil
    end
  end
end
