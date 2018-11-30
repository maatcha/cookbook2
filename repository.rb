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
				csv << ["index", "done", "name", "description", "preparation_time"]
			end

			csv << [@recipe_index, recipe.done, recipe.name, recipe.description, recipe.prep_time]
		end
	end

	def mark_as_done(index)
		table = CSV.table(@csv_file, @csv_options)
		
		table.each do |row|
			if row[0] == index
				row[1] = "X"
			end
		end

		File.open(@csv_file, "w", @csv_options) do |f|
			f.write(table.to_csv)
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
end 
