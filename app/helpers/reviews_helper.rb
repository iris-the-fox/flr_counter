module ReviewsHelper

  def author_count(group)
    h = Hash[group.reviews.pluck(:author).group_by{|x| x}.map{|k,v|[k, v.count]}].sort_by{|a, c| c}.reverse
  end
  
  def grammatical_case(count)
  	array_count = count.to_s.split('')
   	if array_count.last.to_i == 1
  	  return "#{count} отзыв"
  	elsif (2..4).include?(array_count.last.to_i)
  	  return "#{count} отзыва"
  	else
  	  return "#{count} отзывов"
  	end
  end


end

