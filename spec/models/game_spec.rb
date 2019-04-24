require "rails_helper"

RSpec.describe Game do
  describe "initialization" do
    let(:game) { Game.new(name: "AWESOME!", player_one_name: "James", player_two_name: "John") }

    it "creates a game with a name and two player names" do

      expect(game.name).to eq("AWESOME!")
      expect(game.player_one_name).to eq("James")
      expect(game.player_two_name).to eq("John")
    end


  # describe "gameplay" do
  #   it "can change whose turn it is" do
  #     players = []
  #     players << Player.new(name: "Mack")
  #     players << Player.new(name: "Bryce")
  #     game = Game.new(players)
  #     game.change_turn

  #     current_name = game.currently_rolling.name

  #     expect(current_name).to eq("Bryce")
  #   end

  #   it "will go to the correct player after multiple turn changes" do
  #     players = []
  #     players << Player.new(name: "Jack")
  #     players << Player.new(name: "Jill")
  #     game = Game.new(players)
  #     game.change_turn
  #     game.change_turn

  #     current_name = game.currently_rolling.name

  #     expect(current_name).to eq("Jack")
  #   end

    it "can roll the die and set a players position" do
      game.players << Player.new(name: "Mack")
      game.players << Player.new(name: "Bryce")

      game.roll_for(game.players[0])
      expect(game.players[0]).not_to eq(1)
    end

  #   it "can set the players position if it encounters a ladder" do
  #     players = []
  #     players << Player.new(name: "Mack")
  #     players << Player.new(name: "Bryce")
  #     game = Game.new(players)

  #     game.currently_rolling.set_position(15)
  #     game.update_position

  #     expect(game.currently_rolling.position).to eq(26)
  #   end

  #   it "can set the players position back if it encounters a chute" do
  #     players = []
  #     players << Player.new(name: "FIRST")
  #     players << Player.new(name: "SECOND")
  #     game = Game.new(players)

  #     game.currently_rolling.set_position(49)
  #     game.update_position

  #     expect(game.currently_rolling.position).to eq(11)
  #   end
    
  end
  
end
