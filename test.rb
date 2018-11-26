# require "pry"
# require_relative "controller"
# require_relative "repository"

# repo = Repository.new
# con = Controller.new(repo)

# rec1 = Recipe.new("eggs","whooah!")
# rec2 = Recipe.new("beans","mmmh d'accord!")
# repo.add_recipe(rec1)
# repo.add_recipe(rec2)

# repo.remove_recipe(1)

# puts con.list

# rec3 = Recipe.new("buns","what da fuck!")
# rec4 = Recipe.new("honey","yummy yummy!")

# repo.add_recipe(rec3)
# repo.add_recipe(rec4)

# puts con.list


require "csv"
@csv_options = { col_sep: ",", force_quotes: false, headers: :first_row, quote_char: "|" }

table = CSV.table("data.csv", @csv_options)	

table.class.new(table).by_col!

end