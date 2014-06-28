require 'spec_helper'


describe 'searching for country' do
  context 'valid search' do
    it 'should direct user to country page from search' do
      visit home_path
      fill_in "Search for a Country:", :with => "canada"
      click_on "Search"
      expect(current_path).to eq(country_path("Canada"))
    end
  end

  context 'invalid search' do
    it 'should direct user back to home page from search' do
      visit home_path
      fill_in :search, :with => nil
      click_on "Search"
      expect(current_path).to eq(home_path)
    end
  end

end