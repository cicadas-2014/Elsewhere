vaccine_data = File.open('db/data/vaccines.csv')
	vaccines = []
	CSV.foreach(vaccine_data) do |row|
		vaccines << row
	end
	vaccines.flatten!
	p vaccines
Country.all.each do |country|
	if vaccines.include?(country.name)
		country.update_attributes(is_malaria_hotspot: true)
	end
end