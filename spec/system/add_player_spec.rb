require "rails_helper"

RSpec.describe "adding a player", type: :system do
  it "allows a user to add a player to the game" do
    visit new_player_path
    fill_in "Name", with: "FakeMack"
    fill_in "Game", with: 2
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

  it"takes user to Players page upon success" do
    visit new_player_path
    fill_in "Name", with: "FakeName"
    fill_in "Game", with: 2
    click_on("Create Player")
    expect(page).to have_content("Players")
  end
end

RSpec.describe "adding a player fail", type: :system do
  it"displays error when player has no name" do
    visit new_player_path
    click_on("Create Player")
    expect(page).to have_content(`:name, ["can't be blank"]`)
  end

  it "displays game id error when game_id is blank" do
    visit new_player_path
    fill_in "Name", with: "FakeName"
    click_on("Create Player")
  end

    it "displays game id error when game_id is not an int" do
    visit new_player_path
    fill_in "Name", with: "FakeName"
    fill_in "Game", with: "e"
    click_on("Create Player")
  end
end
