require "rails_helper"

RSpec.describe CreatesGame do
  describe "initialization" do
    let(:creator) { CreatesGame.new(name: "GOOD GAME") }

    it "creates a game given a name and the names of the two players" do
      creator.build
      expect(creator.game.name).to eq("GOOD GAME")
    end

    it "no players are part of the game" do
      creator.build
      expect(creator.game.players.size).to eq(0)
    end

    it "generates 100 spaces" do
      creator.build
      expect(creator.game.spaces.size).to eq(100)
    end
  end

  describe "not being created" do
    it "fails when a name isn't supplied" do
      bad_creator = CreatesGame.new(name: "")
      bad_creator.create
      expect(bad_creator.game.errors.messages[:name][0]).to match("can't be blank")
    end
  end
  
end
