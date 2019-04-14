class Review_finder
  attr_accessor :link, :author
	def initialize(shred)
      msg = Message.find_by("body like ?", "%#{shred}%")
      @link = msg.link
      @author = msg.author
  end
end