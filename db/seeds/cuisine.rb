cuisine_data = []
CSV.foreach ("db/data/cuisine.csv") do |row|
  cuisine_data << row
end
data = cuisine_data.flatten
paired = data.each_slice(2)
paired.each do |p|
  if @country = Country.find_by(name: p[0])
  	@country.update(cuisine: p[1])
  end
end