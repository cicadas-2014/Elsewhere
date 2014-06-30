require 'iso_country_codes'
require 'money'
require 'nokogiri'
require 'csv'
require 'flickr'
require 'net/http'


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

require_relative "seeds/country_names"
require_relative "seeds/common_names"
require_relative "seeds/language"
require_relative "seeds/country_intros"
require_relative "seeds/cuisine"
require_relative "seeds/country_images"
require_relative "seeds/political_stability"
require_relative "seeds/vaccines"
require_relative "seeds/phrases"
require_relative "seeds/corruption"



