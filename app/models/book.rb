class Book < ActiveRecord::Base
	belongs_to :user
	validates_presence_of :title, :author, :user_id
  validates :isbn, uniqueness: true
end
