require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application

describe('Test creating Tamagotchi', {:type => :feature}) do
  it('Displays a user''s Tamagotchi') do
    visit('/')
    fill_in('name', :with => "Seymour")
    click_button('Create Tamagotchi')
    click_link("Back to main screen.")
    expect(page).to have_content("Seymour")
  end
end


describe('Test time passing button', {:type => :feature}) do
  it('Passes the time') do
    visit('/')
    fill_in('name', :with => "Seymour")
    click_button('Create Tamagotchi')
    click_link("Back to main screen.")
    expect(page).to have_content("Seymour")
    click_button('Pass Time')
    click_link("Back to main screen.")
    expect(page).to have_content("Food Level: 9")
    expect(page).to have_content("Sleep Level: 9")
    expect(page).to have_content("Activity Level: 9")
  end
end

describe('Test caring buttons', {:type => :feature}) do
  it('Cares') do
    visit('/')
    fill_in('name', :with => "Seymour")
    click_button('Create Tamagotchi')
    click_link("Back to main screen.")
    click_button('Pass Time')
    click_link("Back to main screen.")
    click_button("Feed Me")
    click_link("Back to main screen.")
    expect(page).to have_content("Food Level: 10")
    click_button("Give Me A Nap")
    click_link("Back to main screen.")
    expect(page).to have_content("Sleep Level: 10")
    click_link("Play with me.")
    click_link("Back to main screen.")
    expect(page).to have_content("Activity Level: 10")
  end
end

describe('Test death', {:type => :feature}) do
  it('Kills') do
    visit('/')
    fill_in('name', :with => "Seymour")
    click_button('Create Tamagotchi')
    click_link("Back to main screen.")
    click_button('Pass Time')
    click_link("Back to main screen.")
    click_button('Pass Time')
    click_link("Back to main screen.")
    click_button('Pass Time')
    click_link("Back to main screen.")
    click_button('Pass Time')
    click_link("Back to main screen.")
    click_button('Pass Time')
    click_link("Back to main screen.")
    click_button('Pass Time')
    click_link("Back to main screen.")
    click_button('Pass Time')
    click_link("Back to main screen.")
    click_button('Pass Time')
    click_link("Back to main screen.")
    click_button('Pass Time')
    click_link("Back to main screen.")
    click_button('Pass Time')
    click_link("Back to main screen.")
    expect(page).to have_content("Your Tamagotchi is dead.")
  end
end
