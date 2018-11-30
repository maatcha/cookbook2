require_relative "recipe"
require "nokogiri"
require "open-uri"
require "csv"

class Repository

	def initialize
		@recipe_index = 0
		@csv_file = "data.csv"
		@csv_options = { col_sep: ",", force_quotes: false, headers: :first_row, quote_char: "|" }
	end

	def add_recipe(recipe)

		table = CSV.table(@csv_file, @csv_options)
		table_by_col = table.class.new(table).by_col!
		@recipe_index = table_by_col[0].last.to_i + 1

		CSV.open(@csv_file, "a+", @csv_options) do |csv|
			if CSV.read(@csv_file).empty?
				csv << ["index", "name", "description", "preparation_time"]
			end

			csv << [@recipe_index, recipe.name, recipe.description, recipe.prep_time]
		end
	end

	def remove_recipe(index)
		table = CSV.table(@csv_file, @csv_options)
		
		table.delete_if do |row|
			row[0] == index
		end
		
		File.open(@csv_file, "w", @csv_options) do |f|
			f.write(table.to_csv)
		end
	end

	def search_for_five_recipes(ingredient)
		url = "http://www.letscookfrench.com/recipes/find-recipe.aspx?aqt=#{ingredient}"
		doc = Nokogiri::HTML(open(url), nil, "utf-8")

		recipes = doc.xpath("//div[@class='m_titre_resultat']/a")
	end	

	def search_for_five_descriptions(ingredient)
		url = "http://www.letscookfrench.com/recipes/find-recipe.aspx?aqt=#{ingredient}"
		doc = Nokogiri::HTML(open(url), nil, "utf-8")

		recipes_details = doc.xpath("//div[@class='m_detail_recette']")
	end

	def search_for_five_prep_times(ingredient)
		url = "http://www.letscookfrench.com/recipes/find-recipe.aspx?aqt=#{ingredient}"
		doc = Nokogiri::HTML(open(url), nil, "utf-8")

		recipes_prep_times = doc.xpath("//div[@class='m_detail_time']")
	end


	def import_chosen_recipe(index, recipes)
		recipes[0..4].each_with_index do |recipe, recipe_index|
			recipe.text
			if recipe_index == index
				return recipes[index].text
			end
		end
	end

	def import_chosen_recipe_details(index, recipes_details)
		recipes_details[0..4].each_with_index do |recipe_details, details_index|
			recipe_details.text.strip
			if details_index == index
				return recipes_details[index].text.strip
			end
		end
	end

	def import_chosen_recipe_prep_time(index, recipes_prep_times)
		recipes_prep_times[0..4].each_with_index do |prep_time, prep_index|
		prep_time.text[0..12].scan(/\w/).join
			if prep_index == index
 				return recipes_prep_times[index].text[0..12].scan(/\w/).join
 			end
 		end	
	end
end 
