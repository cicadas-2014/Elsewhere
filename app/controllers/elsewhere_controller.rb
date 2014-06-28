require 'iso_country_codes'

class ElsewhereController < ApplicationController

  def index
  end

  def show
    results = params[:search].capitalize
    if results.length > 2
      if results == ("Russia" || "United States of America")
        @country = Country.find_by(common_name: results)
      else
        @country = Country.find_by(name: results)
        @country_code = IsoCountryCodes.search_by_name(@country.name).first.alpha2
      end
    else
  	   @country = Country.find_by(two_character_code: params[:search])
    end
  	if @country.nil?
  		redirect_to home_path
    else
      render 'show'
  	end 
  end
end
