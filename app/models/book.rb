class Book < ActiveRecord::Base
	belongs_to :reader

	validates :title, presence: true
end