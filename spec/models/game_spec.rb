require "rails_helper"

RSpec.describe Game do
  let(:game) { Game.new(name: "AWESOME!", player_one_name: "James", player_two_name: "John") }
  describe "initialization" do
    
    it "creates a game with a name and two player names" do

      expect(game.name).to eq("AWESOME!")
      expect(game.player_one_name).to eq("James")
      expect(game.player_two_name).to eq("John")
    end
  end

  describe "gameplay" do
    it "can roll the die and set a players position" do
      game.players << Player.new(name: "Mack", position: 1)
      game.players << Player.new(name: "Bryce", position: 1)

      game.roll_for("Mack")
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
  end
  
end
