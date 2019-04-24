require "rails_helper"

RSpec.describe "adding a player", type: :system do
  it "allows a user to add a player to the game" do
    visit new_player_path
    fill_in "Name", with: "Mack"
    click_on("Create Player")
    visit players_path
    expect(page).to have_content("Mack")
  end
end
