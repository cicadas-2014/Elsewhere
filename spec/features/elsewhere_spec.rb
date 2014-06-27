feature 'Elsewhere' do

  scenario 'shows the home page when root path visited' do
    visit root_path
    expect(page).to have_content 'Search for a Country'
    expect(page).to have_button "Search"
  end

  scenario 'show page displays country name' do
    visit root_path
    fill_in "Search for a country:", with: 'USA'
    click_button 'Search'
    expect(page).to have_content 'USA'
    expect(current_path).to eq country_path('USA')
  end

end