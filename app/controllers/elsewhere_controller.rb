class ElsewhereController < ApplicationController

  def index
  end

  def show
  	@country = Country.find_by(name: params[:search])
  	if @country.nil?
  		redirect_to home_path
    else
      render 'show'
  	end 
  end
end
