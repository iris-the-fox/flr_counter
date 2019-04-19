require 'nokogiri'
class MessageArrayWS


    attr_accessor :review_arr

    def initialize(page_body)
     
      doc = Nokogiri::HTML(page_body)
      body = doc.xpath('/html/body')
      content = body.css('.layout .middle .main-container .content')
      forum = content.xpath("table[4]")
      @review_arr = Set[]
      forum.xpath("tr").each do |row|
        review = MessageWS.new(row)
        @review_arr.add(review)

      end

        

    end
end