require "rails_helper"

RSpec.describe "adding a player", type: :system do
  it "allows a user to add a player to the game" do
    visit new_player_path
    fill_in "Name", with: "FakeMack"
    click_on("Create Player")
    visit players_path
    expect(page).to have_content("FakeMack")
  end

  it "allows a user to choose game to add player to" do
    visit new_player_path
    fill_in "Name", with: "FakeName"
    fill_in "Game", with: 2
    click_on("Create Player")
    visit players_path
    expect(page).to have_content("2")
  end

  it "sets players position to 1" do
    visit new_player_path
    fill_in "Name", with: "FakeName"
    fill_in "Game", with: 2
    click_on("Create Player")
    visit players_path
    expect(page).to have_content("1")
  end
end
