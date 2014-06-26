class Language < ActiveRecord::Base
	has_many :countries
	
	validates :name, presence: true, uniqueness: true
end
