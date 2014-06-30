CSV.foreach("db/data/intro.csv") do |c|
	@country = Country.find_by(name: c[0])
	@country.update(intro: c[1])
end

