# frozen_string_literal: true

class MessageWS
  attr_accessor :body, :link, :author

  def initialize(row)
    body = row.xpath('td/table/tr/td/table/tr/td/div/font').text
    @body = body.delete("\n").delete("\r").delete(' ') # текст
    @author = row.xpath('td/span/a/b').text # ник
    link = row.xpath('td/table/tr/td/span/a[1]/@href').text
    @link.delete('"') # ссылка
  end
end
