require "rails_helper"

RSpec.describe CreatesGame do
  describe "initialization" do
    let(:creator) { CreatesGame.new(name: "GOOD GAME", player_one_name: "Player1",
      player_two_name: "Player2") }

    it "creates a game given a name and the names of the two players" do
      creator.build
      expect(creator.game.name).to eq("GOOD GAME")
    end

    it "generates two players that are part of the game" do
      creator.build
      expect(creator.game.players.size).to eq(2)
    end

    it "generates 100 spaces" do
      creator.build
      expect(creator.game.spaces.size).to eq(100)
    end
  end
  
end
