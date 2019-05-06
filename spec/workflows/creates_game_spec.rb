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

    it "sets the first player as the one currenlty rolling" do
      creator.build
      expect(creator.game.currently_rolling).to have_name("Player1")
    end
  end

  describe "not being created" do
    it "fails when a name isn't supplied" do
      bad_creator = CreatesGame.new(name: "", player_one_name: "won't", player_two_name: "be playing")
      bad_creator.create
      expect(bad_creator.game.errors.messages[:name][0]).to match("can't be blank")
    end
  end
  
end
