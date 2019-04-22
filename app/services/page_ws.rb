# frozen_string_literal: true

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
    @body = HTTParty.get(@link).body
    # page = HTTParty.get(@link)
    # doc = Nokogiri::HTML(page.body)
    # body = doc.xpath('/html/body')
    # content = body.css('.layout .middle .main-container .content')
    # @body = content.xpath("table[3]")
  end
end

# @page = PageWS.new(2, 'https://fantlab.ru/forum/forum5page1/topic8081page1')
# puts @page.body
# puts @page.link
# puts @page.number
