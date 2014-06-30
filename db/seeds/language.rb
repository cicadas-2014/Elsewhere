two_codes = []
two_codes = CSV.read('db/data/two_codes.csv')

two_codes.flatten!

two_codes.map!(&:upcase)

two_codes.each_slice(2) do | cc, lc | 
	if country = Country.find_by_two_character_code(cc)
	 country.language_code = lc
	 country.save
    end 
end 

language_array = CSV.read('db/data/language_names.csv')
language_array.flatten!
language_array.each_slice(2) do |language, lc|
	Country.where(language_code: lc).each do |country|
		country.update(language: language) 
	end
end

Country.all.each do |country| 
	if country.language_code == "EN"
		country.update(language: "English")
	end
end