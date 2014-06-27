class ElsewhereController < ApplicationController

  def index
  end

  def search
    country_name = params[:search]
    redirect_to "/#{country_name}"
  end

  def show
  	@country = Country.find_by(name: params[:country_name])
  	if @country.nil?
  		redirect_to home_path
  	end 
  end

end