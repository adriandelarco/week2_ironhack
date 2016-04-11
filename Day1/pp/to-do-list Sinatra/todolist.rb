require './todo.rb'
require 'rubygems'
require 'rspec'
require 'yaml/store'

class TodoList
    attr_reader :tasks, :user, :todo_store

    def initialize(user)
    	@todo_store = YAML::Store.new("./public/tasks.yml")
        @tasks = []
        @user = user
    end

    def add_task(task)
    	@tasks.push(task)
    end

    def delete_task(id)
    	@tasks.each do |task|
    		@tasks.delete_if {|task| task.id == id }
    	end
    end

    def find_task_by_id(id)
    	find_array = @tasks.select {|task| task.id == id }
    end

    def sort_by_created_at(order)
    	if order == "ASC"
    		sorted_tasks = @tasks.sort { | task1, task2 | task2.created_at <=> task1.created_at }
    	elsif order == "DESC"
    		sorted_tasks = @tasks.sort { | task1, task2 | task1.created_at <=> task2.created_at }
    	end

    end
end