require_relative "recipe"
require_relative "view"

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

	private

	def display_recipes
		@view.display
	end
end