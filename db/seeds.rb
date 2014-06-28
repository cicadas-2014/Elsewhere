require 'CSV'

countries = []
countries = CSV.read('db/corruption_2013.csv')
nations = []
countries.each do |country|
	nations << country[0..2]   
end
nations.flatten!





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



english = Language.create(name: "English")
spanish = Language.create(name: "Spanish")
french = Language.create(name: "French")

usa = Country.create(name: "USA", language_id: english.id)
spain = Country.create(name: "Spain", language_id: spanish.id)
france = Country.create(name: "France", language_id: french.id)

Phrase.create(language_id: english.id, hello: "hello", please: "please", thanks: "thanks", bathroom: "Where is the bathroom?")
Phrase.create(language_id: spanish.id, hello: "hola", please: "por favor", thanks: "gracias", bathroom: "Ou est trouvent les toilettes?")
Phrase.create(language_id: french.id, hello: "bonjour", please: "s'il vous plait", thanks: "merci", bathroom: "Donde esta el bano?")

Image.create(country_id: english.id, url: "http://www.scti.com.au/media/1059/travel-insurance-for-usa.jpg")
Image.create(country_id: english.id, url: "http://www.itesolcourse.com/images/location/usa-travel.jpg")
Image.create(country_id: english.id, url: "http://www.foley.com/files/Office/8766eedf-e4b8-42fe-9c37-4f8383686c0d/Presentation/OfficePhoto/washingtondc.jpg")
Image.create(country_id: english.id, url: "http://upload.wikimedia.org/wikipedia/commons/thumb/d/da/SF_From_Marin_Highlands3.jpg/1280px-SF_From_Marin_Highlands3.jpg")

Image.create(country_id: spain.id, url: "https://www.tripextras.com/files/countries/spain_basilicadelpilar.jpg")
Image.create(country_id: spain.id, url: "http://www.fodors.com/world/images/destinations/668/spain.jpg")
Image.create(country_id: spain.id, url: "http://www.fantom-xp.com/wallpapers/63/Travel_Spain.jpg")
Image.create(country_id: spain.id, url: "http://www.survivalspain.com/img/spain-travel-guide-homepage.jpg")

Image.create(country_id: france.id, url: "http://www.wallcoo.net/human/france/images/%5Bwallcoo%5D_france_travel_france_EF004.jpg")
Image.create(country_id: france.id, url: "http://traveldealslady.com/wp-content/uploads/Paris-France-travel-tour-traveltours-travel-agent-deals.jpg")
Image.create(country_id: france.id, url: "http://www.francetravelguide.com/files/2011/11/3952987239_3b29d282b5_z.jpg")
Image.create(country_id: france.id, url: "http://www.fodors.com/world/images/destinations/231/ile-de-france.jpg")

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
