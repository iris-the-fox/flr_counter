# frozen_string_literal: true

class MessageWS
  include StopList	
  attr_accessor :raw_body, :body, :link, :author

  def initialize(row)
  	@raw_body = row.css('font.v9b').children
  	@body = clean_text(@raw_body.text) # текст
    @author = row.xpath('td/span/a/b').text # ник
    link = row.xpath('td/table/tr/td/span/a[1]/@href').text
    @link = link.delete('"') # ссылка
  end
end
