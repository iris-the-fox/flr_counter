# frozen_string_literal: true

require 'httparty'
require 'nokogiri'
class ForumPages
  include HTTParty
  attr_accessor :last_page
  base_uri 'https://fantlab.ru/forum/'

  def initialize(link)
    page = HTTParty.get(link)
    doc = Nokogiri::HTML(page.body)
    body = doc.xpath('/html/body')
    content = body.css('.layout .middle .main-container .content')
    pages = content.css('table td.td-block[1]').text
    standart_pages = pages.tr("\u00A0", ' ')
    @last_page = standart_pages.split(' ').last
  end
end
