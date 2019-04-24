require "rails_helper"

RSpec.describe "starting a new game", type: :system do
  it "allows a user to create and start a new game" do
    visit new_game_path
    fill_in "Name", with: "World Championships 2019"
    fill_in "Player One", with: "Mack"
    fill_in "Player Two", with: "Bryce"
    visit game_path
    expect(page).to have_content("World Champtionships 2019")
  end
end