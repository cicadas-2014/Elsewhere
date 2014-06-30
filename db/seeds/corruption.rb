countries = []
countries = CSV.read('db/data/corruption_2013.csv')
nations = []
countries.each do |country|
	nations << country[0..1]   
end
p nations.flatten!

nations.each_slice(2) do | corruption_code , nation | 
	if country = Country.find_by_name(nation)
		country.corruption_index = corruption_code
		country.save
	end
end