class Book < ActiveRecord::Base
	validates_presence_of :title, :author
	validate :end_after_start?

	def end_after_start?
		errors.add(:end_date, "can't finish before starting") if end_date < start_date
	end
end
