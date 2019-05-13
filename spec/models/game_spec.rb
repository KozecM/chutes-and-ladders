require "rails_helper"

RSpec.describe Game do
  let(:game) { Game.new(name: "FAKE") }
  describe "initialization" do
    
    it "creates a game with a name" do
      expect(game.name).to eq("FAKE")
    end

  end

  describe "gameplay" do
    it "can roll the die and set a players position" do
      game.players << Player.new(name: "FAKE PLAYER ONE")
      game.players << Player.new(name: "FAKE PLAYER TWO")
      game.roll_for("FAKE PLAYER ONE")
      expect(game.players[0].read_attribute(:position)).to_not eq(1)
    end

    it "can set the players position if it encounters a ladder" do
      game.players << Player.new(name: "Mack", position: 1)
      game.players << Player.new(name: "Bryce", position: 1)

      game.spaces = GamesHelper::generate_spaces 

      game.players[1].set_position(15)
      game.update_position_for("Bryce")
      expect(game.players[1].position).to eq(26)
    end

    it "can change whose turn it is to roll" do
      game.players << Player.new(name: "Jocelyn", position: 1)
      game.players << Player.new(name: "Shannon", position: 1)
      first_player = game.players[0]
      game.currently_rolling = first_player
      expect(game.currently_rolling).to have_name("Jocelyn")
      game.change_turn
      expect(game.currently_rolling).to have_name("Shannon")
    end

    it "can switch to the correct player" do
      game.players << Player.new(name: "Abe", position: 1)
      game.players << Player.new(name: "Byron", position: 1)
      game.players << Player.new(name: "Cassie", position: 1)
      game.players << Player.new(name: "Darius", position: 1)

      game.currently_rolling = game.players[0]
      game.change_turn
      game.change_turn
      game.change_turn
      game.change_turn

      expect(game.currently_rolling).to have_name("Abe")
    end

  end
  
end
