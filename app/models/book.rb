class Book < ActiveRecord::Base
	belongs_to :user
	validates_presence_of :title, :author
	validate :end_after_start?

	def end_after_start?
		if end_date && start_date
			errors.add(:end_date, "can't finish before starting") if end_date < start_date
		end
	end
end
