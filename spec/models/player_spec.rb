require "rails_helper"

RSpec.describe Player do
  describe "initialization" do
    let(:player1) { Player.new(name: "Mack") }

    it "creates a player with the players name" do
      expect(player1.name).to eq("Mack")
    end

    it "can be initialized with a different position value" do
      player2 = Player.new(name: "Jack", position: 5)
      expect(player2.position).to eq(5)
    end
  end

  describe "movement" do
    let(:player) { Player.new(name: "Mack", position: 5) }
    
    it "can move forward by a number of positions" do
      player.move(6)
      expect(player.position).to eq(11)
    end

    it "can move backward by a number of positions" do
      player.move(-4)
      expect(player.position).to eq(1)
    end

    it "can be sent to a specific position" do
      player.set_position(50)
      expect(player.position).to eq(50)
    end
  end
  
end
