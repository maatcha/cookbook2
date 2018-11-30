require "pry"
require "nokogiri"

file = "strawberry.html"
doc = Nokogiri::HTML(File.open(file), nil, "utf-8")

recipes = doc.xpath("//div[@class='m_titre_resultat']/a")
recipes_details = doc.xpath("//div[@class='m_detail_recette']")
recipes_prep_times = doc.xpath("//div[@class='m_detail_time']")

 # recipes_prep_times[0..4].each_with_index do |prep_time, prep_index|
 # 	if prep_index == 0
 # 		puts prep_time.text[0..12].scan(/\w/).join
 # 	end
 # end

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

display_five_recipes(recipes, recipes_details, recipes_prep_times)











	# p prep_time
	# p prep_index
# end
# recipes[0..4].each_with_index do |recipe, index|
# 		print "#{index + 1} - " + recipe.text
# 	recipes_details[0..4].each_with_index do |recipe_detail, details_index|
# 		if index == details_index
# 			puts recipe_detail.text.strip
# 		end
# 	end
# end

# binding.pry

# def import_chosen_recipe(index = 1, recipes)
# 	recipes[0..4].each_with_index do |recipe, recipe_index|
# 		recipe.text
# 		if recipe_index == index
# 		p recipes[recipe_index].text
# 		# if recipe_index == index
# 		# 	puts recipe.text
# 		end
# 	end
# end

# import_chosen_recipe(recipes)
