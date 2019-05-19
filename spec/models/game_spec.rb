require "rails_helper"

RSpec.describe Game do
  let(:game) { Game.new(name: "FAKE GAME!") }

  describe "initialization" do
    
    it "creates a game with a name and two player names" do
      expect(game.name).to eq("FAKE GAME!")
    end

  end

  describe "gameplay" do
    it "can roll the die and set a players position" do
      game.players << Player.new(name: "FAKE PLAYER ONE")
      game.players << Player.new(name: "FAKE PLAYER TWO")
      game.spaces = GamesHelper::generate_spaces 
      game.get_current_player.set_position(1)
      game.roll(game.players)
      expect(game.players[0].read_attribute(:position)).to_not eq(1)
    end

    it "can set the players position if it encounters a ladder" do
      game.players << Player.new(name: "FAKE PLAYER ONE")

      game.spaces = GamesHelper::generate_spaces 

      game.get_current_player.set_position(15)
      game.update_position_for(game.get_current_player)
      expect(game.get_current_player.position).to eq(26)
    end
  end

  describe "Using a big dependency" do
    # it "dependency returns 'Game over man! Game over.'" do
    #   big_boi = BigDependency.new
    #   expect(game.perform(big_boi)).to eq("Game over man! Game over.")
    # end

    it "with a fake" do
      fake_big_guy = FakeBigDependency.new

      expect(game.perform(fake_big_guy)).to eq('Game over man! Game over.')
    end

    it "with a stub" do
      big_guy = BigDependency.new

      allow(big_guy).to receive(:execute).and_return("i'm tired")

      expect(game.perform(big_guy)).to eq('Game over man! Game over.')
    end

    it "with a mock using only a double" do
      mock_big_guy = instance_double(BigDependency)

      expect(mock_big_guy).to receive(:execute).once

      expect(game.perform(mock_big_guy)).to eq('Game over man! Game over.')
    end

    it "with a mock using an instance double" do
      mock_big_guy = instance_double(BigDependency)

      expect(mock_big_guy).to receive(:execute).once

      expect(game.perform(mock_big_guy)).to eq('Game over man! Game over.')
    end
    
  end
  
end
