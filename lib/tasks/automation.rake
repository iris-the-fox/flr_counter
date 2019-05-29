namespace :automation do
  # desc "Rake task to get last page of FLR forum"
  # task last_page: :environment do
  # 	puts "I AM WORKING!!"
  # 	Flr.retrieve_last_page
  #   puts "Now last page is #{Flr.find_by(current: true).last_page}"
  # 	puts "#{Time.now} — Success!"
  # end

  #  desc "Rake task to get all pages until last"
  #  task all_pages: :environment do
  # 	puts "I AM WORKING too!!"
  # 	Flr.find_by(current: true).all_pages
  # 	puts "#{Time.now} — Success!"
  # end


  desc "Rake task to get all pages of FLR forum"
  task every_last_page: :environment do
  	puts "I AM WORKING!!"
  	@current_flr = Flr.find_by(current: true)
  	@last_page = @current_flr.last_page
  	Flr.retrieve_last_page
    puts "Now last page is #{@current_flr.last_page}"
    if @current_flr.last_page > @last_page
  	  @current_flr.all_pages
  	  puts "I get every last_page"
  	end
  	puts @last_page
  	puts "#{Time.now} — Success!"
  end



end
