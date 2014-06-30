usa = Country.find_by(name: 'United States')
usa.update(common_name: 'United States of America')
russia = Country.find_by(name: 'Russian Federation')
russia.update(common_name:'Russia')

