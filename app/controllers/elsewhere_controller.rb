class ElsewhereController < ApplicationController

  def index
  end

  def show
    highcharts_country = params[:country_string].split(' ')
    country_array = highcharts_country.split('-')
    country_name = country_array[2]
  	@country = Country.find_by(name: country_name)
  	if @country.nil?
  		redirect_to home_path
    else
      render show_path
  	end 
  end

end
