require "pry"
require_relative "parsing_class_objects"
require_relative "controller"
require_relative "repository"

repo = Repository.new
con = Controller.new(repo)

rec1 = Recipe.new("eggs","whooah!")
rec2 = Recipe.new("beans","mmmh d'accord!")

repo.add_recipe(rec1)
repo.add_recipe(rec2)
repo.remove_recipe(1)

rec3 = Recipe.new("buns","what da fuck!")
rec4 = Recipe.new("honey","yummy yummy!")

repo.add_recipe(rec3)
repo.add_recipe(rec4)

ingredient = "fenouil"
index = 3
chosen_recipe = ImportChosenRecipe.call(index, SearchForFiveRecipes.call(ingredient))
chosen_recipe_details = ImportChosenRecipeDetails.call(index, SearchForFiveDescriptions.call(ingredient))
chosen_recipe_prep_time = ImportChosenRecipePrepTime.call(index, SearchForFivePrepTimes.call(ingredient))
recipe = Recipe.new(chosen_recipe, chosen_recipe_details, chosen_recipe_prep_time)
repo.add_recipe(recipe)

con.list