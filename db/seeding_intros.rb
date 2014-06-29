require 'Nokogiri'
require 'csv'


@intros = []
@countries = ["Aruba",
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
"Zimbabwe"]

@countries.each do |country|
  if country == "Korea, Rep."
    name = "South_Korea"
  elsif country == "Micronesia, Federated States of"
    name = "Federated_States_of_Micronesia"
  elsif country == "Brunei Darussalam"
    name = "Brunei"
  elsif country == "Côte d'Ivoire"
    name = "Ivory_Coast"
  elsif country == "Curaçao"
    name = "Curacao"
  elsif country == "Syrian Arab Republic"
    name = "Syria"
  elsif country == "Congo"
    name = "Democratic_Republic_of_the_Congo"
  elsif country == "Georgia"
    name = "Georgia_(country)"
  elsif country == "Macedonia"
    name = "Republic_of_Macedonia"
  else
    multiple = country.split(" ")
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
        
      @intros << ("#{country.name}""#{@i1} #{@i2}")
  elsif name == ("Honduras")
    doc = Nokogiri::XML(open('http://wikitravel.org/en/'+ name))
        intro1 = doc.css('#content p:eq(1)')
        intro2 = doc.css('#content p:eq(2)')
   

          @i1 = intro1[0].content
          @i2 = intro2[0].content
        
      @intros << ("#{country.name}""#{@i1} #{@i2}")
    elsif name == ("Qatar")
    doc = Nokogiri::XML(open('http://wikitravel.org/en/'+ name))
        intro1 = doc.css('#content p:eq(1)')
        intro2 = doc.css('#content p:eq(2)')
   

          @i1 = intro1[0].content
          @i2 = intro2[0].content
        
      @intros << ("#{country.name}""#{@i1} #{@i2}")
    elsif name == ("Pakistan")
    doc = Nokogiri::XML(open('http://wikitravel.org/en/'+ name))
        intro1 = doc.css('#content p:eq(1)')
        intro2 = doc.css('#content p:eq(2)')
   

          @i1 = intro1[0].content
          @i2 = intro2[0].content
        
      @intros << ("#{country.name}""#{@i1} #{@i2}")
    elsif name == ("Malawi")
    doc = Nokogiri::XML(open('http://wikitravel.org/en/'+ name))
        intro1 = doc.css('#content p:eq(1)')
        intro2 = doc.css('#content p:eq(2)')
   

          @i1 = intro1[0].content
          @i2 = intro2[0].content
        
      @intros << ("#{country.name}""#{@i1} #{@i2}")
    elsif name == ("Spain")
    doc = Nokogiri::XML(open('http://wikitravel.org/en/'+ name))
        intro1 = doc.css('#content p:eq(1)')
        intro2 = doc.css('#content p:eq(2)')
   

          @i1 = intro1[0].content
          @i2 = intro2[0].content
        
      @intros << ("#{country.name}""#{@i1} #{@i2}")
    elsif name == ("Algeria")
    doc = Nokogiri::XML(open('http://wikitravel.org/en/'+ name))
        intro1 = doc.css('#content p:eq(1)')
        intro2 = doc.css('#content p:eq(2)')
   

          @i1 = intro1[0].content
          @i2 = intro2[0].content
        
      @intros << ("#{country.name}""#{@i1} #{@i2}")
    elsif name == ("Dominican_Republic")
    doc = Nokogiri::XML(open('http://wikitravel.org/en/'+ name))
        intro1 = doc.css('#content p:eq(1)')
        intro2 = doc.css('#content p:eq(2)')
   

          @i1 = intro1[0].content
          @i2 = intro2[0].content
        
      @intros << ("#{country.name}""#{@i1} #{@i2}")
    elsif name == ("Bolivia")
    doc = Nokogiri::XML(open('http://wikitravel.org/en/'+ name))
        intro1 = doc.css('#content p:eq(1)')
        intro2 = doc.css('#content p:eq(2)')
   

          @i1 = intro1[0].content
          @i2 = intro2[0].content
        
      @intros << ("#{country.name}""#{@i1} #{@i2}")
  elsif name == ("Puerto_Rico")
      @intros << ("#{country.name}""Sunrise and sunset are both worth waiting for when you are in Puerto Rico. The pinks and yellows that hang in the early-morning sky are just as compelling as the sinewy reds and purples that blend into the twilight. Its easy to compare them, as Puerto Rico is so narrow that you can easily have breakfast in Fajardo, looking eastward over the boats headed to enchanted islands like Vieques and Culebra, then settle down for a lobster dinner in Rincon as the sun is sinking into the inky-blue water.")
  elsif name == ("Mongolia")
    doc = Nokogiri::XML(open('http://wikitravel.org/en/'+ name))
        intro1 = doc.css('#content p')
   

          @i1 = intro1[0].content
        
      @intros << ("#{country.name}""#{@i1}")
  elsif name == ("Netherlands")
    doc = Nokogiri::XML(open('http://wikitravel.org/en/'+ name))
        intro1 = doc.css('#content p:eq(1)')
        intro2 = doc.css('#content p:eq(2)')
   

          @i1 = intro1[0].content
          @i2 = intro2[0].content
        
      @intros << ("#{country.name}""#{@i1} #{@i2}")
  elsif name == ("Nicaragua")
    doc = Nokogiri::XML(open('http://wikitravel.org/en/'+ name))
        intro1 = doc.css('#content p:eq(1)')
        intro2 = doc.css('#content p:eq(2)')
   

          @i1 = intro1[0].content
          @i2 = intro2[0].content
        
      @intros << ("#{country.name}""#{@i1} #{@i2}")
  elsif name == ("Mexico")
    doc = Nokogiri::XML(open('http://wikitravel.org/en/'+ name))
        intro1 = doc.css('#content p:eq(1)')
        intro2 = doc.css('#content p:eq(2)')
   

          @i1 = intro1[0].content
          @i2 = intro2[0].content
        
      @intros << ("#{country.name}""#{@i1} #{@i2}")
  elsif name == ("Russian_Federation")
      @intros << ("#{country.name}""The grandeur of the Czars, the brutality of Soviet regime, the literary masterpieces baring the Russian soul, and the onion domes of the cathedrals all have captivated the imagination of generations of travellers. Now Russia is shedding its Soviet past and creating itself anew. The palaces, cathedrals, and statues are all still there. But today's Russia is cynical and hip and full of contrasts. Trendy art galleries replaced the Soviet factories in many cities and fierce capitalism has created the wildly rich. More billionaires live in Moscow today than anywhere else, where restaurants, nightclubs and shops have taken luxury to a new level. In the new Russia, it seems anything is possible.")
  else
    p name
    p country
        doc = Nokogiri::XML(open('http://wikitravel.org/en/'+ name))
        intro1 =  doc.css('#mw-content-text table tr:eq(1) p:eq(2)')
        intro2 =  doc.css('#mw-content-text table tr:eq(1) p:eq(3)')

          @i1 = intro1[0].content
          @i2 = intro2[0].content

      @intros << ("#{country.name}""#{@i1} #{@i2}")
  end
end 


CSV.open("db/intro.csv") do |csv|
  csv << @intros
end
