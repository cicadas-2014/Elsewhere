class Country < ActiveRecord::Base
	has_many :phrases
	has_many :images
	
	validates :name, presence: true, uniqueness: true
end
