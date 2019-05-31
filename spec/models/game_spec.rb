require "rails_helper"

RSpec.describe Game do
  let(:valid_game) { FactoryBot.build_stubbed(:game) }
  let(:nameless_game) { FactoryBot.build_stubbed(:nameless_game) }
  let(:nil_game) { FactoryBot.build_stubbed(:nil_game) }

  describe "Initialized Games are valid with name" do
    it "Creates a game with a name" do
      expect(valid_game).to have_name("FAKE GAME")
    end
  end

  describe "Game validation" do
    it "A game without a name is invalid" do
      expect(nameless_game).not_to be_valid
      expect(nameless_game.errors[:name]).to eq(["can't be blank"])
    end

    it "A game with a nil name is invalid" do
      expect(nil_game).not_to be_valid
      expect(nil_game.errors[:name]).to eq(["can't be blank"])
    end
  end

  describe "Gameplay Tests:" do
    it "Can roll the die and set a players position" do
      valid_game.players << Player.new(name: "FAKE PLAYER ONE")
      valid_game.players << Player.new(name: "FAKE PLAYER TWO")

      valid_game.spaces = GamesHelper::generate_spaces

      valid_game.get_current_player.set_position(1)
      valid_game.roll(valid_game.players)

      expect(valid_game.players[0].read_attribute(:position)).to_not eq(1)
    end

    it "Can set the players position if it encounters a ladder" do
      valid_game.players << Player.new(name: "FAKE PLAYER ONE")

      valid_game.spaces = GamesHelper::generate_spaces 

      valid_game.get_current_player.set_position(15)
      valid_game.update_position_for(valid_game.get_current_player)
      expect(valid_game.get_current_player.position).to eq(26)
    end
  end
  
end
