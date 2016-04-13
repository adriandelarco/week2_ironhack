require './todolist.rb'
require './todo.rb'
require "pry"

describe TodoList do 

	before(:each) do
	  @todolist = TodoList.new("Juan")
	  @task = Task.new("Tarea")
	end

	describe "#new" do
	  it 'creates and instance of TodoList' do
	  	expect(@todolist).to be_an_instance_of(TodoList)
	  end
	end

	describe "#add_task" do	
		it "add_task should add the task to the todolist" do
			@todolist.add_task(@task)
			expect(@todolist.tasks.last).to eq @task
	 	end
	end

	describe "#delete_task" do	
		it "delete_task should delete the task from the todolist" do
			@todolist.delete_task(@task)
			expect(@todolist.tasks).not_to include @task
	 	end
	end

	describe "#find_task_by_id" do	
		it "find a task by id in the todolist" do
			@todolist.add_task(@task)
			expect(@todolist.find_task_by_id(@task.id)).to eq [@task]
	 	end
	end
	
	describe "#sort_by_created_at" do
		before(:each) do
			@task = Task.new("Tarea")
		  	@task2 = Task.new("Tarea 2")
			@task3 = Task.new("Tarea 3")
			@todolist.add_task(@task2)
			@todolist.add_task(@task)
			@todolist.add_task(@task3)
		end
		it "it should sort the todolist by descending created_at date" do
			expect(@todolist.sort_by_created_at("DESC")).to eq [@task, @task2, @task3]
	 	end
	 	it "it should sort the todolist by ascending created_at date" do
			expect(@todolist.sort_by_created_at("ASC")).to eq [@task3, @task2, @task]
	 	end
	end

end