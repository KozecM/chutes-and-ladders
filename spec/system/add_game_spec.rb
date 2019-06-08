require "rails_helper"

RSpec.describe "starting a new game", type: :system do
  it "allows a user to create and start a new game" do
    visit new_game_path
    fill_in "Name", with: "World Championships 2019"
    click_on("Create Game")
    expect(page).to have_content("World Championships 2019")
    (1..100).each do |i|
      expect(page).to have_content(i)
    end
  end

  it "allows a user to select a game and be linked to the right page" do
    visit new_game_path
    fill_in "Name", with: "BAD BOI"
    click_on("Create Game")
    visit games_path
    click_on("BAD BOI")
    expect(page).to have_content("Game Display")
    expect(page).to have_content("Game Name: BAD BOI")
  end

  it "allows a user to add player to game" do
     visit new_game_path
     fill_in "Name", with: "World Championships 2019"
     click_on("Create Game")
     click_link("Add a player")
     expect(page).to have_content("Add Player")
  end

  describe "fails", type: :system do
    it "displays error when game has no name" do
      visit new_game_path
      click_on("Create Game")
      expect(page).to have_content("can't be blank")
    end
  end
end


