require 'iso_country_codes'

class ElsewhereController < ApplicationController

  def index
  end

  def direction
  end

  def show
    search = params[:search].split(" ").map { |word| word.capitalize }.join(" ")
    if search == ("Russia" || "United States of America")
      @country = Country.find_by(common_name: search)
    elsif search.length == 2
      @country = Country.find_by(two_character_code: params[:search])
    else
      @country = Country.find_by(name: search)
    end
    if @country.nil?
      redirect_to home_path
    else
      render 'show'
    end
  end


end
