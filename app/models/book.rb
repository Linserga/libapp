class Book < ActiveRecord::Base
	mount_uploader :cover, CoverUploader

	belongs_to :reader

	validates :title, presence: true

	
end