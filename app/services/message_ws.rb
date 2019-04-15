class MessageWS
  attr_accessor :body, :link, :author

  def initialize(row)
    @body = row.xpath('td/table/tr/td/table/tr/td/div/font').text.gsub( /\n/, "" ) # текст
    @author =  row.xpath('td/span/a/b').text # ник
    @link = row.xpath('td/table/tr/td/span/a[1]/@href')gsub( /\"/, "" ) #ссылка
  end

end