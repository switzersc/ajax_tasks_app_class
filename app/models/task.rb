class Task < ActiveRecord::Base
	scope :incomplete, -> { where.not(completed: true) }

	validates_presence_of :due_date	
end
