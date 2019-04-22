require "rails_helper"

RSpec.describe Game do
  describe "initialization" do
    it "creates a game with a list of players" do
      players = []
      players << Player.new(name: "Mack")
      players << Player.new(name: "Bryce")
      game = Game.new(players)

      expect(game.players[0].name).to eq("Mack")
      expect(game.players[1].name).to eq("Bryce")
    end

    it "generates a board that has 100 spaces" do
      players = []
      players << Player.new(name: "Mack")
      players << Player.new(name: "Bryce")
      game = Game.new(players)

      expect(game.board.size).to eq(100)
    end

    it "sets the first player as the current turn" do
      players = []
      players << Player.new(name: "Mack")
      players << Player.new(name: "Bryce")
      game = Game.new(players)

      expect(game.currently_rolling.name).to eq("Mack")
    end
  end

  describe "gameplay" do
    it "can change whose turn it is" do
      players = []
      players << Player.new(name: "Mack")
      players << Player.new(name: "Bryce")
      game = Game.new(players)
      game.change_turn

      current_name = game.currently_rolling.name

      expect(current_name).to eq("Bryce")
    end

    it "will go to the correct player after multiple turn changes" do
      players = []
      players << Player.new(name: "Jack")
      players << Player.new(name: "Jill")
      game = Game.new(players)
      game.change_turn
      game.change_turn

      current_name = game.currently_rolling.name

      expect(current_name).to eq("Jack")
    end

    it "can roll the die and set a players position" do
      players = []
      players << Player.new(name: "Mack")
      players << Player.new(name: "Bryce")
      game = Game.new(players)

      game.roll
      expect(game.currently_rolling.position).not_to eq(1)
    end

    it "can set the players position if it encounters a ladder" do
      players = []
      players << Player.new(name: "Mack")
      players << Player.new(name: "Bryce")
      game = Game.new(players)

      game.currently_rolling.set_position(15)
      game.update_position

      expect(game.currently_rolling.position).to eq(26)
    end

    it "can set the players position back if it encounters a chute" do
      players = []
      players << Player.new(name: "FIRST")
      players << Player.new(name: "SECOND")
      game = Game.new(players)

      game.currently_rolling.set_position(49)
      game.update_position

      expect(game.currently_rolling.position).to eq(11)
    end
    
  end
  
end
