# frozen_string_literal: true

class MessageWS
  include StopList	
  attr_accessor :body, :link, :author

  def initialize(row)
    body = row.xpath('td/table/tr/td/table/tr/td/div/font').text
    @body = clean_text(body) # текст
    @author = row.xpath('td/span/a/b').text # ник
    link = row.xpath('td/table/tr/td/span/a[1]/@href').text
    @link = link.delete('"') # ссылка
  end
end
