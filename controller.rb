require_relative "parsing_class_objects"
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
		@view.display_five_recipes(SearchForFiveRecipes.call(ingredient), SearchForFiveDescriptions.call(ingredient), SearchForFivePrepTimes.call(ingredient))
		index = @view.ask_user_for_recipe_index
		chosen_recipe = ImportChosenRecipe.call(index, SearchForFiveRecipes.call(ingredient))
		chosen_recipe_details = ImportChosenRecipeDetails.call(index, SearchForFiveDescriptions.call(ingredient))
		chosen_recipe_prep_time = ImportChosenRecipePrepTime.call(index, SearchForFivePrepTimes.call(ingredient))
		recipe = Recipe.new(chosen_recipe, chosen_recipe_details, chosen_recipe_prep_time)
		@repository.add_recipe(recipe)
	end

	def mark_a_recipe_as_done
		@view.display
		index = @view.ask_user_for_which_recipe_he_has_already_made
		@repository.mark_as_done(index)
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