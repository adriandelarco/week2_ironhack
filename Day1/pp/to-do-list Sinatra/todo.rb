require 'rubygems'
require 'rspec'
require 'rspec_boolean'
require 'date'

class Task
    attr_reader :content, :id, :complete, :created_at, :updated_at
    @@current_id = 1
    def initialize(content)
        @content = content
        @id = @@current_id
        @@current_id += 1
        @complete = false
        @created_at = DateTime.now
        @updated_at = nil
    end

    def complete?
    	@complete
    end

    def complete!
    	@complete = true
    end

    def make_incomplete!
    	@complete = false
    end

    def update_content!(content)
    	if content != nil
			@content = content
			@updated_at = DateTime.now
		end
    end

end
