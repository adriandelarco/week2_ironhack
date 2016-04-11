require './todo.rb'

describe Task do

	before(:each) do
		@task = Task.new("Hola")  
	end

	describe "#complete?" do
		it "complete true or false task" do
			expect(@task.complete?).to be_boolean
		end
	end

	describe "#complete!" do
		it "complete should be true" do	
			@task.complete!
			expect(@task.complete).to be true
		end
	end

	describe "#make_incomplete!" do
		it "complete should be false" do	
			@task.make_incomplete!
			expect(@task.complete).to be false
		end
	end	

	describe "#update_content!" do

		context "check .content instance variable" do
			it "should update the content" do	
				@task.update_content!("ABC")
				expect(@task.content).to eq "ABC"
			end
			it "content should be something" do	
				@task.update_content!(nil)
				expect(@task.content).to eq "Hola"
			end
			it "content could be integer" do	
				@task.update_content!(5)
				expect(@task.content).to eq 5
			end
		end

		context "check update_at instance variable" do
			it "should update the update_at date" do	
				@t = DateTime.now.strftime "%d/%m/%Y %H:%M:%S"
				@task.update_content!("ABC")
				expect(@task.updated_at.strftime "%d/%m/%Y %H:%M:%S").to eq(@t)
			end
		end

	end

end