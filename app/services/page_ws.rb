require 'httparty'
require 'nokogiri'
class PageWS
  	include HTTParty
    base_uri 'https://fantlab.ru/forum/'
    attr_accessor :body, :link, :number

    def initialize(page_number, link)
      @number = page_number
      link_ingot = link.split('page')
      @link = "#{link_ingot[0]}page#{link_ingot[1]}page#{@number}"
      page = HTTParty.get(link)
      doc = Nokogiri::HTML(page.body)
      body = doc.xpath('/html/body')
      content = body.css('.layout .middle .main-container .content')
      @body = content.xpath("table[3]")

    end
end


# page = PageWS.new(1)
# puts page.body
# puts page.link
# puts page.number

 