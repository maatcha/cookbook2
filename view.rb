class View
	
	def display
		puts "ID: (DONE ?)--NAME------------------------------;----DESCRIPTION----------------==> PREPARATION TIME"
		csv_options = { col_sep: ",", force_quotes: false, headers: :first_row, quote_char: "|" }
			CSV.foreach("data.csv", csv_options) do |row|
				puts "#{row["index"]} : [#{row["done"]}] #{row["name"]} ; #{row["description"]} ==> #{row["preparation_time"]}"
				puts "----------------------------------------------------------------------------------------------------------"
			end
	end

	def display_five_recipes(recipes, recipes_details, recipes_prep_times)
		recipes[0..4].each_with_index do |recipe, index|
			print "#{index + 1} - " + recipe.text + " : "
			recipes_details[0..4].each_with_index do |recipe_details, details_index|
				if index == details_index
					print recipe_details.text.strip + " => "
				 	recipes_prep_times[0..4].each_with_index do |prep_time, prep_index|
				 		if prep_index == index
 							puts prep_time.text[0..12].scan(/\w/).join
 						end
 					end	
				end
			end
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

	def ask_user_for_prep_time
		puts "How much time does your recipe take ?"
		gets.chomp
	end

	def ask_user_for_index
		puts "Index?"
		gets.chomp.to_i
	end

	def ask_user_for_recipe_index
		puts ""
		puts "Which recipe would you like to import ? (Index)"
		gets.chomp.to_i - 1
	end

	def ask_user_for_ingredient
		puts "What ingredient would you like a recipe for ?"
		ingredient = gets.chomp
		puts ""
		puts "Looking for #{ingredient} on LetsCookFrench..."
		puts ""
		ingredient
	end

	def ask_user_for_which_recipe_he_has_already_made
		puts "Which one you've already made and you want to mark as done ? (Index)"
		gets.chomp.to_i
	end	

	def say_goodbye
		puts "Ciao !"
	end
end