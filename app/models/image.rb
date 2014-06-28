class Image < ActiveRecord::Base
	belongs_to :country

	def thumbnail_url
		self.url.gsub(".jpg", "_q.jpg")
	end

	def large_url
		self.url.gsub(".jpg", "_z.jpg")
	end
end
