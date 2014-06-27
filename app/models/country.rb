class Country < ActiveRecord::Base
	belongs_to :language
	has_many :phrases, foreign_key: :language_id
	has_many :images
	
	validates :name, presence: true, uniqueness: true
end
