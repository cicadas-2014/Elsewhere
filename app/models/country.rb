class Country < ActiveRecord::Base
	belongs_to :language
	has_many :phrases, through: :language, source: :phrases 
	has_many :images
	
	validates :name, presence: true, uniqueness: true
end
