require_relative "recipe"
require "csv"
require 'nokogiri'
require "pry"

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
				csv << ["index", "name", "description"]
			end

			csv << [@recipe_index, recipe.name, recipe.description]
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
		file = "strawberry.html"
		doc = Nokogiri::HTML(File.open(file), nil, "utf-8")

		recipes = doc.xpath("//div[@class='m_titre_resultat']/a")
	end	

	def search_for_five_descriptions(ingredient)
		file = "strawberry.html"
		doc = Nokogiri::HTML(File.open(file), nil, "utf-8")

		recipes_details = doc.xpath("//div[@class='m_detail_recette']")
	end

	def import_chosen_recipe(index, recipes)
		recipes[0..4].each_with_index do |recipe, recipe_index|
			recipe.text
			if recipe_index == index
				recipes[recipe_index].text
			end
		end
	end

	def import_chosen_recipe_details(index, recipes_details)
		recipes_details[0..4].each_with_index do |recipe_detail, details_index|
			recipe_detail.text.strip
			if details_index == index
				recipes_detail[details_index].text.strip
			end
		end
	end
end 
