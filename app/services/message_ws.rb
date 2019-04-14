class MessageWS
  attr_accessor :body, :link, :author

  def initialize(row)
    @body = row.xpath('td/table/tr/td/table/tr/td/div/font').inner_html # текст
    @author =  row.xpath('td/span/a/b').text # ник
    @link = row.xpath('td/table/tr/td/span/a[1]').map{ |link| link['href'] } #ссылка
  end

end