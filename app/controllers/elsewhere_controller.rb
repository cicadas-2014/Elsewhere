class ElsewhereController < ApplicationController

  def index
  end

  def show
  	@country = Country.find_by(name: params[:country_name])
  	if @country.nil?
  		redirect_to home_path
  	end 
  end

end
