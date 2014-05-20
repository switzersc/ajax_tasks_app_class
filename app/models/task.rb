class Task < ActiveRecord::Base
	belongs_to :user
	scope :incomplete, -> { where.not(completed: true) }

	validates_presence_of :due_date	
end
