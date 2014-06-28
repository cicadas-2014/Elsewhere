

require 'CSV'
require 'iso_country_codes'
require 'money'
require 'Nokogiri'

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

# hello_array = CSV.read('db/hello_list.csv')
# hello_array.flatten!
# greeting_array = []
# hello_array.map_slice(2) do | language, hello |


end

hello_array.each_slice(2) do |language, hello|
	if country = Country.find_by_language(language)
		Phrase.create(hello: hello, country_id: country.id)
	end
end



