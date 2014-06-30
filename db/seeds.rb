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

require_relative "country_names"
require_relative "common_names"
require_relative "language"
require_relative "country_intros"
require_relative "cuisine"
require_relative "country_images"
require_relative "political_stability"
require_relative "vaccines"
require_relative "phrases"
require_relative "corruption"



