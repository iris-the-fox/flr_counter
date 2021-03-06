# frozen_string_literal: true

module ReviewsHelper
  def general_review
    if @general_reviews.nil?
      {''=>''}
    else
    Hash[@general_reviews.pluck(:author).group_by { |x| x }.map { |k, v| [k, v.count] }] 
  end
  end

  def grammatical_case(count)
    array_count = count.to_s.split('')
    if array_count.last.to_i == 1
      return "#{count} отзыв"
    elsif (2..4).cover?(array_count.last.to_i)
      return "#{count} отзыва"
    else
      return "#{count} отзывов"
    end
  end

  # def quotes(msg)

  #   msg_array = msg.split("\n")
  #   new_msg_array = []
  #   msg_array.each do |str|

  #     if str == "цитата"
  #       puts str
  #       new_msg_array << "[q]"
  #     elsif str == "конец цитаты"
  #       new_msg_array << "[/q]"
  #     else
  #       new_msg_array << str
  #     end
  #   end

  #   return msg = new_msg_array.join
  # end
end
