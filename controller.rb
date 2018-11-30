require_relative "recipe"
require_relative "view"
require "pry"

class Controller
	
	def initialize(repository)
	@repository = repository
	@view = View.new
	end

	def list
		@view.display
	end

	def create
		name = @view.ask_user_for_name
		description = @view.ask_user_for_description
		prep_time = @view.ask_user_for_prep_time
		recipe = Recipe.new(name, description, prep_time)
		@repository.add_recipe(recipe)
	end

	def import
		ingredient = @view.ask_user_for_ingredient
		recipes = @repository.search_for_five_recipes(ingredient)
		recipes_details = @repository.search_for_five_descriptions(ingredient)
		recipes_prep_times = @repository.search_for_five_prep_times(ingredient)
		@view.display_five_recipes(recipes, recipes_details, recipes_prep_times)
		index = @view.ask_user_for_recipe_index
		chosen_recipe = @repository.import_chosen_recipe(index, recipes)
		chosen_recipe_details = @repository.import_chosen_recipe_details(index, recipes_details)
		chosen_recipe_prep_time = @repository.import_chosen_recipe_prep_time(index, recipes_prep_times)
		recipe = Recipe.new(chosen_recipe, chosen_recipe_details, chosen_recipe_prep_time)
		@repository.add_recipe(recipe)
	end

	def mark_a_recipe_as_done
		@view.display
		index = @view.ask_user_for_which_recipe_he_has_already_made
		@repository.mark_a_recipe_as_done(index)
	end
	
	def destroy
		@view.display
		index = @view.ask_user_for_index
		@repository.remove_recipe(index)
	end

	def quit
		@view.say_goodbye
		exit
	end
end