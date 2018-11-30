class Router
	
	def initialize(controller)
		@controller = controller
	end

	def run
		loop do
			print_actions
			action = gets.chomp.to_i
			dispatch(action)
		end
	end

	private

	def print_actions
		puts "\n---"
		puts "What do you want to do ?"
		puts "1 - List recipes"
		puts "2 - Add a new recipe"
		puts "3 - Import recipes from LetsCookFrench"
		puts "4 - Mark a recipe as done"
		puts "5 - Delete a recipe"
		puts "6 - Exit"
		puts "---"
	end

	def dispatch(action)
		case action
		when 1 then @controller.list
		when 2 then @controller.create
		when 3 then @controller.import
		when 4 then @controller.mark_a recipe_as_done
		when 5 then @controller.destroy
		when 6 then @controller.quit
		else
			puts "Wrong action, please type 1, 2, 3, 4, 5 or 6 !"
		end
	end
end