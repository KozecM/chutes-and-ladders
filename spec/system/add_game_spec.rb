require "rails_helper"

Rspec.describe "adding a game", type: :system do
  it "allows user to start a new game" do
    visit new_game_path
    expect(page).to have_content
  end
end