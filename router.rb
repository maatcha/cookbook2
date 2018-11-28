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

	def csv_initialize
	end

	private

	def print_actions
		puts "\n---"
		puts "What do you want to do ?"
		puts "1 - List recipes"
		puts "2 - Add a new recipe"
		puts "3 - Delete a recipe"
		puts "4 - Import recipes from LetsCookFrench"
		puts "5 - Exit"
		puts "---"
	end

	def dispatch(action)
		case action
		when 1 then @controller.list
		when 2 then @controller.create
		when 3 then @controller.destroy
		when 4 then @controller.import
		when 5 then @controller.exit
		else
			puts "Wrong action, please type 1, 2, 3, 4 or 5 !"
		end
	end
end