require 'httparty'
require 'nokogiri'
class Forum_pages
  include HTTParty
  attr_accessor :last_page
  base_uri 'https://fantlab.ru/forum/'
  
  def initialize(link)
       # page = HTTParty.get('https://fantlab.ru/forum/forum13page1/topic10641page1')

       page = HTTParty.get(link)
       doc = Nokogiri::HTML(page.body)
       body = doc.xpath('/html/body')
       content = body.css('.layout .middle .main-container .content')
       pages = content.css("table td.td-block[1]").text
       @last_page = pages.split(' ').last
  end

end
