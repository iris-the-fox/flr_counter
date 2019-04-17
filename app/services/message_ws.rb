class MessageWS
  attr_accessor :body, :link, :author

  def initialize(row)
    @body = row.xpath('td/table/tr/td/table/tr/td/div/font').text.gsub( /\n/, "" ).gsub( /\r/, "" ).gsub( " ", "" ) # текст
    @author =  row.xpath('td/span/a/b').text # ник
    @link = row.xpath('td/table/tr/td/span/a[1]/@href').text.gsub( /\"/, "" ) #ссылка
  end

end