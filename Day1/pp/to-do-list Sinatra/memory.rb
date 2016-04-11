require './todolist.rb'

class Memory

	def initialize(todolist)
		@todolist = todolist
	end
		
    def save
		@todolist.todo_store.transaction do 
			@todolist.todo_store[@todolist.user] = @todolist.tasks
		end
	end
	
	def load_tasks
		@todolist.tasks = YAML.load_file("./public/tasks.yml")
	end
end

todo_list = TodoList.new("Josh")
task = Task.new("Walk the dog")
task2 = Task.new("Buy the milk")
task3 = Task.new("Make my todo list into a web app")
todo_list.add_task(task)
todo_list.add_task(task2)
todo_list.add_task(task3)

memory1 = Memory.new(todo_list)
memory1.save