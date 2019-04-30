# frozen_string_literal: true

module GroupsHelper
	def author_count
      h = {}  
      @exept_general.map do |s| 
        h1 = Hash[s.reviews.pluck(:author).group_by { |x| x }.map { |k, v| [k, v.count] }] 
        h.merge!(h1){|key, oldval, newval| newval + oldval} 
      end 
      h
    end
end
