require 'csv'


CSV.foreach("db/intro.csv") do |c|
  p c[1]
end

