
=begin
SEEDS FILE CURRENTLY TAKES CARE OF:
country names, country wiki info, flickr images, official currency, corruption index, official language, cuisine
=end


require 'iso_country_codes'
require 'money'
require 'nokogiri'
require 'csv'
require 'flickr'


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

################ THIS SEEDS THE COUNTRY NAMES ################ 
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


russia = Country.find_by_name("Russian Federation")
russia.common_name = "Russia"
russia.save



################Intros####################

CSV.foreach("db/intro.csv") do |c|
	@country = Country.find_by(name: c[0])
	@country.update(intro: c[1])
end



usa = Country.find_by(name: 'United States')
usa.update(common_name: 'United States of America')
russia = Country.find_by(name: 'Russian Federation')
russia.update(common_name:'Russia')



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




############### THIS SEEDS THE IMAGES ################ 
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

############THIS SEEDS POLITICAL RATING###########

poli_ratings = []
data = File.open('db/politicalstability.csv')
CSV.foreach(data) do |row|
	poli_ratings << [row[0],row[1].gsub(/\t/,'').to_f]
end

poli_ratings.each do |rating|
	code = IsoCountryCodes.search_by_name(rating[0]).first.alpha3
	country = Country.find_by(three_character_code: code)
	if country
		country.update_attributes(political_stability: rating[1])
	end
end
#####################Seeds Vaccines###############

vaccine_data = File.open('db/vaccines.csv')
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

################Seeds four phrases from google translate####

require 'net/http'


terms = ["hello", "please", "thanks", "where is the bathroom"]
uri_terms = terms.map { |term| term.gsub(" ", "%20") }

source_language = "en"


target_language = []

countries = Country.all
countries.each do | country | 
	target_language << country.id 
	target_language << country.language_code
end



target_language.each_slice(2) do |country_id, target_language|	
	
	uri_terms.each_slice(4) do |hello, please, thanks, bathroom|
		
		r_hello = URI("https://translate.google.com/translate_a/single?client=t&sl=#{source_language}&tl=#{target_language}&hl=en&dt=bd&dt=ex&dt=ld&dt=md&dt=qc&dt=rw&dt=rm&dt=ss&dt=t&dt=at&dt=sw&ie=UTF-8&oe=UTF-8&oc=2&prev=btn&ssel=0&tsel=0&q=#{hello}")	
	    hello_r = Net::HTTP.get_response(r_hello)
	    if hello_r.code == "200" && hello_r.body.match(/(\[\[\[")(.+?)(")/)
	       hello_phrase = hello_r.body.match(/(\[\[\[")(.+?)(")/)[2]  
	    else
	       hello_phrase = "wazzup"
	    end

		r_please = URI("https://translate.google.com/translate_a/single?client=t&sl=#{source_language}&tl=#{target_language}&hl=en&dt=bd&dt=ex&dt=ld&dt=md&dt=qc&dt=rw&dt=rm&dt=ss&dt=t&dt=at&dt=sw&ie=UTF-8&oe=UTF-8&oc=2&prev=btn&ssel=0&tsel=0&q=#{please}")
		please_r = Net::HTTP.get_response(r_please)
		if please_r.code == "200" && please_r.body.match(/(\[\[\[")(.+?)(")/)
		   please_phrase = please_r.body.match(/(\[\[\[")(.+?)(")/)[2]
		else
		   please_phrase = "Pretty Please"
		end
		
		r_thanks = URI("https://translate.google.com/translate_a/single?client=t&sl=#{source_language}&tl=#{target_language}&hl=en&dt=bd&dt=ex&dt=ld&dt=md&dt=qc&dt=rw&dt=rm&dt=ss&dt=t&dt=at&dt=sw&ie=UTF-8&oe=UTF-8&oc=2&prev=btn&ssel=0&tsel=0&q=#{thanks}")
		thanks_r = Net::HTTP.get_response(r_thanks)
		if thanks_r.code == "200" && thanks_r.body.match(/(\[\[\[")(.+?)(")/)
		   thanks_phrase = thanks_r.body.match(/(\[\[\[")(.+?)(")/)[2]
		else
		   thanks_phrase = "Much Obliged Partner"
		end

		r_bathroom = URI("https://translate.google.com/translate_a/single?client=t&sl=#{source_language}&tl=#{target_language}&hl=en&dt=bd&dt=ex&dt=ld&dt=md&dt=qc&dt=rw&dt=rm&dt=ss&dt=t&dt=at&dt=sw&ie=UTF-8&oe=UTF-8&oc=2&prev=btn&ssel=0&tsel=0&q=#{bathroom}")
		bathroom_r = Net::HTTP.get_response(r_bathroom)
		if bathroom_r.code == "200" && bathroom_r.body.match(/(\[\[\[")(.+?)(")/)
		   bathroom_phrase = bathroom_r.body.match(/(\[\[\[")(.+?)(")/)[2]
		else
		   bathroom_phrase = "Latrine Please"
		end

		Phrase.create(hello: hello_phrase.force_encoding('UTF-8'), please: please_phrase.force_encoding('UTF-8'), thanks: thanks_phrase.force_encoding('UTF-8'), bathroom: bathroom_phrase.force_encoding('UTF-8'), country_id: country_id)
	    
	end
	
end

p "done"

################ THIS SEEDS THE CORRUPTION ################ 

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

################ THIS SEEDS THE LANGUAGE ################ 

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

# EOF



