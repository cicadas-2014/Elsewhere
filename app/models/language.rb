class Language < ActiveRecord::Base
	has_many :countries
	has_many :phrases
	
	validates :name, presence: true, uniqueness: true
end
