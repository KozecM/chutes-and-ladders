require "rails_helper"

RSpec.describe "adding a space", type: :system do
  it "allows a user to space to the game" do
    visit new_space_path
    fill_in "Space type", with: "chute"
    click_on("Create Space")
    visit spaces_path
    expect(page).to have_content("chute")
  end
end
