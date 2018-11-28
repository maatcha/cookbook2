require "nokogiri"

file = "strawberry.html"
doc = Nokogiri::HTML(File.open(file), nil, "utf-8")

recipes = doc.xpath("//div[@class='m_titre_resultat']/a")
recipes_details = doc.xpath("//div[@class='m_detail_recette']")
# recipes[0..4].each_with_index do |recipe, index|
# 		print "#{index + 1} - " + recipe.text
# 	recipes_details[0..4].each_with_index do |recipe_detail, details_index|
# 		if index == details_index
# 			puts recipe_detail.text.strip
# 		end
# 	end
# end
def import_chosen_recipe(index = 1, recipes)
	recipes[0..4].each_with_index do |recipe, recipe_index|
		recipe.text
		if recipe_index == index
		p recipes[recipe_index].text.class
		# if recipe_index == index
		# 	puts recipe.text
		end
	end
end

import_chosen_recipe(recipes)
