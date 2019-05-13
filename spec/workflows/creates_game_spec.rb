require "rails_helper"

RSpec.describe CreatesGame do
  describe "initialization" do
    let(:creator) { CreatesGame.new(name: "FAKE") }

    it "creates a game given a name and the names of the two players" do
      creator.build
      expect(creator.name).to eq("FAKE")
    end

    it "players are able to be added to players array" do
      creator.create
      byebug
      creator.players << Player.new(name: "FAKE PLAYER ONE")
      creator.players << Player.new(name: "FAKE PLAYER TWO")
      expect(creator.players.count).to eq(2)
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
