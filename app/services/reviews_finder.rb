require 'httparty'
require 'nokogiri'
class Reviews_finder
	include HTTParty
  #page_uri = '/topic10641page1'
  #'https://fantlab.ru/forum/forum13page1/'
  #page = ForumWS.get(page_uri)
  page = HTTParty.get('https://fantlab.ru/forum/forum13page1/topic10641page1')
  doc = Nokogiri::HTML(page.body)
  body = doc.xpath('/html/body')
  content = body.css('.layout .middle .main-container .content')
  forum = content.xpath("table[3]")
  all_msg = []
  forum.xpath("tr").each do |row|
   #puts row # row - это сообщение целиком с автором и ссылкой
   all_msg << row
  end
  string = "депутатский, пардон, мандат..." 

  all_msg.each do |msg|

    text =  msg.xpath('td/table/tr/td/table/tr/td/div').to_s # текст
   if text.match(string)
     puts nickname =  msg.xpath('td/span/a/b').text # ник
     puts link = msg.xpath('td/table/tr/td/span/a[1]').map{ |link| link['href'] } #ссылка
   end
  end

  
  
  

end