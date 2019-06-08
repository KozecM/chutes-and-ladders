require "rails_helper"

RSpec.describe Game do
  let(:valid_game) { FactoryBot.build_stubbed(:game) }
  let(:nameless_game) { FactoryBot.build_stubbed(:nameless_game) }
  let(:nil_game) { FactoryBot.build_stubbed(:nil_game) }
<<<<<<< HEAD
  let(:dice) { Dice.new() }
=======
  let(:player1) {Player.new(name: "FAKE PLAYER ONE")}
  let(:player2) {Player.new(name: "FAKE PLAYER TWO")}
>>>>>>> 1e7948b356e231e94559524823ba9699c0c0d19d

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
      valid_game.players << player1
      valid_game.players << player2

      valid_game.get_current_player.set_position(1)
      valid_game.roll(valid_game.players,dice)

      expect(valid_game.players[0].read_attribute(:position)).to_not eq(1)
    end

    it "Can set the players position if it encounters a ladder" do
      valid_game.players << player1
      
      valid_game.get_current_player.set_position(15)
      valid_game.update_position_for(valid_game.get_current_player)
      expect(valid_game.get_current_player.position).to eq(26)
    end

    it "Can set the players position if it encounters a chute" do
      valid_game.players << player1

      player = valid_game.get_current_player

      player.set_position(16)
      valid_game.update_position_for(player)
      expect(player.position).to eq(6)
    end

    it "Can set player as a winner when player lands on the last space " do
      valid_game.players << player1
      valid_game.players << player2

      player = valid_game.get_current_player

      player.set_position(100)

      expect(valid_game.game_winner(player)).to be(player1)
    end
  end
  
end
