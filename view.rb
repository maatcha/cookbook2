class View
	
	def display
		puts "INDEX--NAME : DESCRIPTION-----------------------------------------------"
		csv_options = { col_sep: ",", force_quotes: false, headers: :first_row, quote_char: "|" }
			CSV.foreach("data.csv", csv_options) do |row|
				puts "#{row["index"]} : #{row["name"]} ; #{row["description"]}"
				puts "---------------------------------------------------------------------"
			end
	end	


	def ask_user_for_name
		puts "Which name for your recipe ?"
		gets.chomp
	end

	def ask_user_for_description
		puts "What's the description of that recipe ?"
		gets.chomp
	end

	def ask_user_for_index
		puts "Index?"
		gets.chomp.to_i
	end
end