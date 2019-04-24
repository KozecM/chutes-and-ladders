require "rails_helper"

RSpec.describe CreatesGame do
  describe "initialization" do
    it "creates a game given a name and the names of the two players" do
      creator = CreatesGame.new(name: "GOOD GAME", player_one_name: "Player1",
        player_two_name: "Player2");
      creator.build
      expect(creator.game.name).to eq("GOOD GAME")
    end
  end
  
end
