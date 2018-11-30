require "pry"
require "nokogiri"
require "open-uri"

class SearchForFiveRecipes
	def self.call(ingredient)
		url = "http://www.letscookfrench.com/recipes/find-recipe.aspx?aqt=#{ingredient}"
		doc = Nokogiri::HTML(open(url), nil, "utf-8")

		recipes = doc.xpath("//div[@class='m_titre_resultat']/a")
	end
end

class SearchForFiveDescriptions
	def self.call(ingredient)
		url = "http://www.letscookfrench.com/recipes/find-recipe.aspx?aqt=#{ingredient}"
		doc = Nokogiri::HTML(open(url), nil, "utf-8")
		
		recipes_details = doc.xpath("//div[@class='m_detail_recette']")
	end
end

class SearchForFivePrepTimes
	def self.call(ingredient)
		url = "http://www.letscookfrench.com/recipes/find-recipe.aspx?aqt=#{ingredient}"
		doc = Nokogiri::HTML(open(url), nil, "utf-8")

		recipes_prep_times = doc.xpath("//div[@class='m_detail_time']")
	end
end

class ImportChosenRecipe
	def self.call(index, recipes)
		recipes[0..4].each_with_index do |recipe, recipe_index|
			recipe.text
			if recipe_index == index
				return recipes[index].text
			end
		end
	end
end

class ImportChosenRecipeDetails
	def self.call(index, recipes_details)
		recipes_details[0..4].each_with_index do |recipe_details, details_index|
			recipe_details.text.strip
			if details_index == index
				return recipes_details[index].text.strip
			end
		end
	end
end

class ImportChosenRecipePrepTime
	def self.call(index, recipes_prep_times)	
		recipes_prep_times[0..4].each_with_index do |prep_time, prep_index|
		prep_time.text[0..12].scan(/\w/).join
			if prep_index == index
	 			return recipes_prep_times[index].text[0..12].scan(/\w/).join
	 		end
	 	end	
	end
end