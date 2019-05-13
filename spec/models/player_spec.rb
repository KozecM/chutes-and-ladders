require "rails_helper"

RSpec.describe Player do
  describe "initialization" do
    let(:player1) { Player.new(name: "Mack") }

    it "creates a player with the players name" do
      expect(player1).to have_name("Mack")
    end

    it "can be initialized with a different position value" do
      player2 = Player.new(name: "Jack", position: 5)
      expect(player2).to have_position(5)
    end

    it "isn't a valid player if its name is blank" do
      bad_player = Player.new(name: "", position: 5)
      expect(bad_player).not_to be_valid
      expect(bad_player.errors[:name]).to eq(["can't be blank", "is too short (minimum is 2 characters)"])
    end

    it "isn't a valid player if the name is nil" do
      nil_player = Player.new
      expect(nil_player).to have_name(nil)
      expect(nil_player).not_to be_valid
      expect(nil_player.errors[:name]).to eq(["can't be blank", "is too short (minimum is 2 characters)"])
    end
  end

  describe "movement" do
    let(:player) { Player.new(name: "Mack", position: 5) }
    
    it "can move forward by a number of positions" do
      player.move(6)
      expect(player).to have_position(11)
    end

    it "can move backward by a number of positions" do
      player.move(-4)
      expect(player).to have_position(1)
    end

    it "can be sent to a specific position" do
      player.set_position(50)
      expect(player).to have_position(50)
    end

    it "won't move the player above a space of 100" do
      player.set_position(90)
      expect(player).to have_position(90)
      player.move(11)
      expect(player).not_to have_position(101)
    end

    it "won't set the position below a space of 1" do
      player.set_position(1)
      expect(player).to have_position(1)
      player.move(-5)
      expect(player).not_to have_position(-4)
    end
  end

end
