# frozen_string_literal: true

require 'httparty'
require 'nokogiri'
class ForumWS
  include HTTParty
  base_uri 'https://fantlab.ru/forum/'
  attr_accessor :review_arr

  def initialize(page_number)
    page = HTTParty.get("https://fantlab.ru/forum/forum13page1/topic10641page#{page_number}")
    doc = Nokogiri::HTML(page.body)
    body = doc.xpath('/html/body')
    content = body.css('.layout .middle .main-container .content')
    forum = content.xpath('table[3]')
    @review_arr = Set[]
    forum.xpath('tr').each do |row|
      review = Reviews_finder.new(row)
      @review_arr.add(review)
    end
  end
end

# forum = ForumWS.new(1)
# puts forum.body_ar.class
# puts forum.link_ar.class
# puts forum.author_ar.class
