module ReviewsHelper



def author_count(author)
	@count = 0
	@group.reviews.each do |r|
			if r.author == author
				@count+=1
			end
	end
	@count
end


end
