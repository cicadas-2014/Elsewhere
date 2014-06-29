class Country < ActiveRecord::Base
	has_many :phrases
	has_many :images
	
	validates :name, presence: true, uniqueness: true

	def political_rating
		if self.political_stability
			if self.political_stability < -1.0
				"Highest Risk"
			elsif self.political_stability < 0
				"Moderate Risk"
			elsif self.political_stability < 1
				"Minor Risk"
			else
				"Lowest Risk"
			end
		end
	end

	def malaria?
		if self.is_malaria_hotspot
			"Warning: Malaria Hotspot!"
		else
			"Not a known Malaria risk zone."
		end
	end

	def display_language
		self.language ? self.language : "Not sure, but English will probably be OK."
	end

end
