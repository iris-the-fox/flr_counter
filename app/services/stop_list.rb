module StopList
	def delete_smiles(str)
		smiles = [':-)))', ':-(((', ':-)', ';-)', '8-)', ':-D', ':-(', '???', '%-\\',  '>:-|', ':-[', 'o_O', '8-]', ':cool!:', '^_^', ':box:', ':beer:', '8:-0', ';)']
		smiles.each do |smile|
			# puts str
			# puts smile
			# @new_str = str.gsub(smile)
			# puts @new_str
			str.gsub!(smile, '')
		end
		str
	end

	def clean_text(str)
		res_str = str.delete("\n").delete("\r").delete(' ').delete('"').delete('\\')
	end


end
