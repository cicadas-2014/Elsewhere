poli_ratings = []
data = File.open('db/data/politicalstability.csv')
CSV.foreach(data) do |row|
	poli_ratings << [row[0],row[1].gsub(/\t/,'').to_f]
end

poli_ratings.each do |rating|
	code = IsoCountryCodes.search_by_name(rating[0]).first.alpha3
	country = Country.find_by(three_character_code: code)
	if country
		country.update_attributes(political_stability: rating[1])
	end
end