class Reviews_finder
  include HTTParty
  base_uri 'https://fantlab.ru/forum/'
  attr_accessor :body, :link, :author

  def initialize(row)
    @body = row.xpath('td/table/tr/td/table/tr/td/div').to_s # текст
    @author =  row.xpath('td/span/a/b').text # ник
    @link = row.xpath('td/table/tr/td/span/a[1]').map{ |link| link['href'] } #ссылка
  end

end