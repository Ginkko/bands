require('spec_helper')
require('capybara/rspec')
require('./app')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe 'Adding a band path', :type => :feature do
  it 'Shows a welcome page. On clicking add band link, shows a page with forms for creating a new band. On submit, shows the list of bands.' do
    visit '/'
    click_on 'manage_bands'
    fill_in 'band_name', with: 'Poison Sauce'
    click_button 'band_save'
    expect(page).to have_content('Poison Sauce')
  end
end

describe 'Adding a venue path', :type => :feature do
  it 'Shows a welcome page. On clicking add venue link, shows a page with forms for creating a new venue. On submit, shows the list of venues.' do
    visit '/'
    click_on 'manage_venues'
    fill_in 'venue_name', with: 'Amphitheatre O Rama'
    click_button 'venue_save'
    expect(page).to have_content('Amphitheatre O Rama')
  end
end

describe 'Adding a band to a venue path', :type => :feature do
  it 'Starts on the bands page. Lets a user click on a band to see details for that band. Lets a user add a venue to that band' do
    venue = Venue.create(name: 'Amphitheatre O Rama')
    band = Band.create(name: 'Poison Sauce')
    visit '/bands'
    click_on 'Poison Sauce'
    check(venue.id)
    click_button 'add_venues'
    expect(page).to have_content('Amphitheatre O Rama')
  end
end

describe 'Adding a venue to a band path', :type => :feature do
  it 'Starts on the venues page. Lets a user click on a venue to see details for that venue. Lets a user add a band to that venue' do
    venue = Venue.create(name: 'Amphitheatre O Rama')
    band = Band.create(name: 'Poison Sauce')
    visit '/venues'
    click_on 'Amphitheatre O Rama'
    check(band.id)
    click_button 'add_bands'
    expect(page).to have_content('Poison Sauce')
  end
end

describe 'Updating and Deleting a Band from the list of bands', :type => :feature do
  it 'deletes a band' do
    band_0 = Band.create(name: 'Spam Kings')
    band_1 = Band.create(name: 'Lard Dudes')
    visit "/bands/#{band_1.id}"
    expect(page).to have_content(band_1.name)
    click_button 'delete_band'
    expect(page).to_not have_content("#{band_1.name}")
    expect(page).to have_content(band_0.name)
  end
  it 'updates the band name' do
    band = Band.create(name: 'Milk Men')
    visit "/bands/#{band.id}"
    fill_in 'new_band_name', with: 'Sour Cream Crazies'
    click_button 'update_band'
    expect(page).to have_content 'Sour Cream Crazies'
  end
end
