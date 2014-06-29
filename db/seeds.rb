


require 'CSV'

require 'iso_country_codes'
require 'money'
require 'nokogiri'

def two_code(country_name)
	code = IsoCountryCodes.search_by_name(country_name).first.alpha2
end

def three_code(country_name)
	code = IsoCountryCodes.search_by_name(country_name).first.alpha3
end

def currency(country_name)
	currency_code = IsoCountryCodes.search_by_name(country_name).first.currency
	currency = Money.new(1000,currency_code).currency.name
end


["Aruba",
"Andorra",
"Afghanistan",
"Angola",
"Albania",
"United Arab Emirates",
"Argentina",
"Armenia",
"American Samoa",
"Antigua and Barbuda",
"Australia",
"Austria",
"Azerbaijan",
"Burundi",
"Belgium",
"Benin",
"Burkina Faso",
"Bangladesh",
"Bulgaria",
"Bahrain",
"Bahamas",
"Bosnia and Herzegovina",
"Belarus",
"Belize",
"Bermuda",
"Bolivia",
"Brazil",
"Barbados",
"Brunei Darussalam",
"Bhutan",
"Botswana",
"Central African Republic",
"Canada",
"Switzerland",
"Chile",
"China",
"Côte d'Ivoire",
"Cameroon",
"Congo",
"Colombia",
"Comoros",
"Cabo Verde",
"Costa Rica",
"Cuba",
"Curaçao",
"Cayman Islands",
"Cyprus",
"Czech Republic",
"Germany",
"Djibouti",
"Dominica",
"Denmark",
"Dominican Republic",
"Algeria",
"Ecuador",
"Egypt",
"Eritrea",
"Spain",
"Estonia",
"Ethiopia",
"Finland",
"Fiji",
"France",
"Faroe Islands",
"Micronesia, Federated States of",
"Gabon",
"United Kingdom",
"Georgia",
"Ghana",
"Guinea",
"Gambia",
"Guinea-Bissau",
"Equatorial Guinea",
"Greece",
"Grenada",
"Greenland",
"Guatemala",
"Guam",
"Guyana",
"Hong Kong",
"Honduras",
"Croatia",
"Haiti",
"Hungary",
"Indonesia",
"India",
"Ireland",
"Iran",
"Iraq",
"Iceland",
"Israel",
"Italy",
"Jamaica",
"Jordan",
"Japan",
"Kazakhstan",
"Kenya",
"Kyrgyzstan",
"Cambodia",
"Kiribati",
"Saint Kitts and Nevis",
"Korea, Rep.",
"Kuwait",
"Lao",
"Lebanon",
"Liberia",
"Libya",
"Saint Lucia",
"Liechtenstein",
"Sri Lanka",
"Lesotho",
"Lithuania",
"Luxembourg",
"Latvia",
"Saint Martin",
"Morocco",
"Monaco",
"Moldova",
"Madagascar",
"Maldives",
"Mexico",
"Marshall Islands",
"Macedonia",
"Mali",
"Malta",
"Myanmar",
"Montenegro",
"Mongolia",
"Northern Mariana Islands",
"Mozambique",
"Mauritania",
"Mauritius",
"Malawi",
"Malaysia",
"Namibia",
"New Caledonia",
"Niger",
"Nigeria",
"Nicaragua",
"Netherlands",
"Norway",
"Nepal",
"New Zealand",
"Oman",
"Pakistan",
"Panama",
"Peru",
"Philippines",
"Palau",
"Papua New Guinea",
"Poland",
"Puerto Rico",
"Korea",
"Portugal",
"Paraguay",
"French Polynesia",
"Qatar",
"Romania",
"Russian Federation",
"Rwanda",
"Saudi Arabia",
"Sudan",
"Senegal",
"Singapore",
"Solomon Islands",
"Sierra Leone",
"El Salvador",
"San Marino",
"Somalia",
"Serbia",
"South Sudan",
"Sao Tome and Principe",
"Suriname",
"Slovakia",
"Slovenia",
"Sweden",
"Swaziland",
"Sint Maarten",
"Seychelles",
"Syrian Arab Republic",
"Turks and Caicos Islands",
"Chad",
"Togo",
"Thailand",
"Tajikistan",
"Turkmenistan",
"Timor-Leste",
"Tonga",
"Trinidad and Tobago",
"Tunisia",
"Turkey",
"Tanzania",
"Uganda",
"Ukraine",
"Uruguay",
"United States",
"Uzbekistan",
"Saint Vincent and the Grenadines",
"Venezuela",
"Virgin Islands",
"Vietnam",
"Vanuatu",
"Samoa",
"Yemen",
"South Africa",
"Zambia",
"Zimbabwe"].each do |country|
  Country.create(name:country, two_character_code: two_code(country), three_character_code: three_code(country), currency: currency(country))
end



require 'CSV'

countries = []
countries = CSV.read('db/corruption_2013.csv')
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

russia = Country.find_by_name("Russian Federation")
russia.common_name = "Russia"
russia.save

require 'CSV'

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

hello_array = CSV.read('db/hello_list.csv')
hello_array.flatten!
greeting_array = []
hello_array.map_slice(2) do | language, hello |

################Intros####################

Country.all.each do |country|
	if country.name == "Korea, Rep."
		name = "South_Korea"
	elsif country.name == "Micronesia, Federated States of"
		name = "Federated_States_of_Micronesia"
	elsif country.name == "Brunei Darussalam"
		name = "Brunei"
	elsif country.name == "Côte d'Ivoire"
		name = "Ivory_Coast"
	elsif country.name == "Curaçao"
		name = "Curacao"
	elsif country.name == "Syrian Arab Republic"
		name = "Syria"
	elsif country.name == "Congo"
		name = "Democratic_Republic_of_the_Congo"
	elsif country.name == "Georgia"
		name = "Georgia_(country)"
	elsif country.name == "Macedonia"
		name = "Republic_of_Macedonia"
	else
		multiple = country.name.split(" ")
		if multiple.count > 1
			name = multiple.join("_")
		else
			name = multiple[0]
		end
	end
	if name == ("Finland")
		doc = Nokogiri::XML(open('http://wikitravel.org/en/'+ name))
				intro1 = doc.css('#content p:eq(1)')
	      intro2 = doc.css('#content p:eq(2)')
	 

					@i1 = intro1[0].content
					@i2 = intro2[0].content
				
			country.update(intro: "#{@i1} #{@i2}")
	elsif name == ("Honduras")
		doc = Nokogiri::XML(open('http://wikitravel.org/en/'+ name))
				intro1 = doc.css('#content p:eq(1)')
	      intro2 = doc.css('#content p:eq(2)')
	 

					@i1 = intro1[0].content
					@i2 = intro2[0].content
				
			country.update(intro: "#{@i1} #{@i2}")
		elsif name == ("Qatar")
		doc = Nokogiri::XML(open('http://wikitravel.org/en/'+ name))
				intro1 = doc.css('#content p:eq(1)')
	      intro2 = doc.css('#content p:eq(2)')
	 

					@i1 = intro1[0].content
					@i2 = intro2[0].content
				
			country.update(intro: "#{@i1} #{@i2}")
		elsif name == ("Pakistan")
		doc = Nokogiri::XML(open('http://wikitravel.org/en/'+ name))
				intro1 = doc.css('#content p:eq(1)')
	      intro2 = doc.css('#content p:eq(2)')
	 

					@i1 = intro1[0].content
					@i2 = intro2[0].content
				
			country.update(intro: "#{@i1} #{@i2}")
		elsif name == ("Malawi")
		doc = Nokogiri::XML(open('http://wikitravel.org/en/'+ name))
				intro1 = doc.css('#content p:eq(1)')
	      intro2 = doc.css('#content p:eq(2)')
	 

					@i1 = intro1[0].content
					@i2 = intro2[0].content
				
			country.update(intro: "#{@i1} #{@i2}")
		elsif name == ("Spain")
		doc = Nokogiri::XML(open('http://wikitravel.org/en/'+ name))
				intro1 = doc.css('#content p:eq(1)')
	      intro2 = doc.css('#content p:eq(2)')
	 

					@i1 = intro1[0].content
					@i2 = intro2[0].content
				
			country.update(intro: "#{@i1} #{@i2}")
		elsif name == ("Algeria")
		doc = Nokogiri::XML(open('http://wikitravel.org/en/'+ name))
				intro1 = doc.css('#content p:eq(1)')
	      intro2 = doc.css('#content p:eq(2)')
	 

					@i1 = intro1[0].content
					@i2 = intro2[0].content
				
			country.update(intro: "#{@i1} #{@i2}")
		elsif name == ("Dominican_Republic")
		doc = Nokogiri::XML(open('http://wikitravel.org/en/'+ name))
				intro1 = doc.css('#content p:eq(1)')
	      intro2 = doc.css('#content p:eq(2)')
	 

					@i1 = intro1[0].content
					@i2 = intro2[0].content
				
			country.update(intro: "#{@i1} #{@i2}")
		elsif name == ("Bolivia")
		doc = Nokogiri::XML(open('http://wikitravel.org/en/'+ name))
				intro1 = doc.css('#content p:eq(1)')
	      intro2 = doc.css('#content p:eq(2)')
	 

					@i1 = intro1[0].content
					@i2 = intro2[0].content
				
			country.update(intro: "#{@i1} #{@i2}")
	elsif name == ("Puerto_Rico")
			country.update(intro: "Sunrise and sunset are both worth waiting for when you're in Puerto Rico. The pinks and yellows that hang in the early-morning sky are just as compelling as the sinewy reds and purples that blend into the twilight. It's easy to compare them, as Puerto Rico is so narrow that you can easily have breakfast in Fajardo, looking eastward over the boats headed to enchanted islands like Vieques and Culebra, then settle down for a lobster dinner in Rincon as the sun is sinking into the inky-blue water.")
	elsif name == ("Mongolia")
		doc = Nokogiri::XML(open('http://wikitravel.org/en/'+ name))
				intro1 = doc.css('#content p')
	 

					@i1 = intro1[0].content
				
			country.update(intro: "#{@i1}")
	elsif name == ("Netherlands")
		doc = Nokogiri::XML(open('http://wikitravel.org/en/'+ name))
				intro1 = doc.css('#content p:eq(1)')
	      intro2 = doc.css('#content p:eq(2)')
	 

					@i1 = intro1[0].content
					@i2 = intro2[0].content
				
			country.update(intro: "#{@i1} #{@i2}")
	elsif name == ("Nicaragua")
		doc = Nokogiri::XML(open('http://wikitravel.org/en/'+ name))
				intro1 = doc.css('#content p:eq(1)')
	      intro2 = doc.css('#content p:eq(2)')
	 

					@i1 = intro1[0].content
					@i2 = intro2[0].content
				
			country.update(intro: "#{@i1} #{@i2}")
	elsif name == ("Mexico")
		doc = Nokogiri::XML(open('http://wikitravel.org/en/'+ name))
				intro1 = doc.css('#content p:eq(1)')
	      intro2 = doc.css('#content p:eq(2)')
	 

					@i1 = intro1[0].content
					@i2 = intro2[0].content
				
			country.update(intro: "#{@i1} #{@i2}")
	elsif name == ("Russian_Federation")
			country.update(intro: "The grandeur of the Czars, the brutality of Soviet regime, the literary masterpieces baring the Russian soul, and the onion domes of the cathedrals all have captivated the imagination of generations of travellers. Now Russia is shedding its Soviet past and creating itself anew. The palaces, cathedrals, and statues are all still there. But today's Russia is cynical and hip and full of contrasts. Trendy art galleries replaced the Soviet factories in many cities and fierce capitalism has created the wildly rich. More billionaires live in Moscow today than anywhere else, where restaurants, nightclubs and shops have taken luxury to a new level. In the new Russia, it seems anything is possible.")
	else
		p name
		p country.name
				doc = Nokogiri::XML(open('http://wikitravel.org/en/'+ name))
				intro1 =  doc.css('#mw-content-text table tr:eq(1) p:eq(2)')
	      intro2 =  doc.css('#mw-content-text table tr:eq(1) p:eq(3)')

					@i1 = intro1[0].content
					@i2 = intro2[0].content

				
			country.update(intro: "#{@i1} #{@i2}")
	end
end	

# #################Common Names####################

usa = Country.find_by(name: 'United States')
usa.update(common_name: 'United States of America')
russia = Country.find_by(name: 'Russian Federation')
russia.update(common_name:'Russia')
# #################Languages####################
hello_array.each_slice(2) do |language, hello|
	if country = Country.find_by_language(language)
		Phrase.create(hello: hello, country_id: country.id)
	end
end
#################Cuisines####################
cuisine_data = []
CSV.foreach ("db/cuisine.csv") do |row|
  cuisine_data << row
end
data = cuisine_data.flatten
paired = data.each_slice(2)
paired.each do |p|
  if @country = Country.find_by(name: p[0])
  	@country.update(cuisine: p[1])
  end
end


################ THIS SEEDS THE IMAGES ################ 
require 'flickr'
flickr = Flickr.new(ENV["FLICKR_KEY"])

Country.all.each do |country|	
	photos = flickr.photos_search(
		content_type: 1, 
		safe_search: 1, 
		tags: "#{country.name}, travel, beautiful",
		tag_mode: "all", 
		privacy_filter: 1, 
		sort: "interestingness-desc",
		media: "photos",
		)
	
	photos[0..3].each do |photo|
		country.images << Image.create(url: photo.source)
	end
end
