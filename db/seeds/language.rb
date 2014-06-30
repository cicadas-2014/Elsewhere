two_codes = []
two_codes = CSV.read('db/two_codes.csv')

two_codes.flatten!

two_codes.map!(&:upcase)

two_codes.each_slice(2) do | cc, lc | 
	if country = Country.find_by_two_character_code(cc)
	 country.language_code = lc
	 country.save
    end 
end 

language_array = CSV.read('db/language_names.csv')
language_array.flatten!
nations = []
language_array.each_slice(2) do |language, lc|
	if country = Country.find_by_language_code(lc)
		country.language = language
		country.save
	end
end

Country.all.each do | country | 

	if country.language_code == "EN"
		country.language = "English"
		country.save
	end

end