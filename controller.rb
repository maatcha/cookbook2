require_relative "recipe"
require_relative "view"
require "pry"

class Controller
	
	def initialize(repository)
	@repository = repository
	@view = View.new
	end

	def list
		display_recipes
	end

	def create
		name = @view.ask_user_for_name
		description = @view.ask_user_for_description
		recipe = Recipe.new(name, description)
		@repository.add_recipe(recipe)
	end

	def destroy
		display_recipes
		index = @view.ask_user_for_index
		@repository.remove_recipe(index)
	end

	def import
		ingredient = @view.ask_user_for_ingredient
		recipes = @repository.search_for_five_recipes(ingredient)
		recipes_details = @repository.search_for_five_descriptions(ingredient)
		@view.display_five_recipes(recipes, recipes_details)
		index = @view.ask_user_for_recipe_index
		chosen_recipe = @repository.import_chosen_recipe(index, recipes)
		chosen_recipe_details = @repository.import_chosen_recipe_details(index, recipes_details)
		recipe = Recipe.new(chosen_recipe, chosen_recipe_details)
		@repository.add_recipe(recipe)
	end

	def exit
		@view.say_goodbye
	end

	private

	def display_recipes
		@view.display
	end
end