require "rails_helper"

RSpec.describe "starting a new game", type: :system do
  it "allows a user to create and start a new game" do
    visit new_game_path
    fill_in "Name", with: "World Championships 2019"
    click_on("Create Game")
    expect(page).to have_content("World Championships 2019")
  end

  it "won't without a name for the game" do
    visit new_game_path
    fill_in "Name", with: ""
    click_on("Create Game")
    expect(page).to have_content("can't be blank")
  end

  it "allows a user to add player to game" do
     visit new_game_path
     fill_in "Name", with: "World Championships 2019"
     click_on("Create Game")
     expect(page).to have_content("Add a player")
  end
end
