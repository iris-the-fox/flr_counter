require 'nokogiri'
class MessageWS

    base_uri 'https://fantlab.ru/forum/'
    attr_accessor :review_arr

    def initialize(page_body)
     
      doc = Nokogiri::HTML(page_bbody)
      body = doc.xpath('/html/body')
      content = body.css('.layout .middle .main-container .content')
      forum = content.xpath("table[3]")
      @review_arr = Set[]
      forum.xpath("tr").each do |row|
        review = Reviews_finder.new(row)
        @review_arr.add(review)

      end

        

    end
end