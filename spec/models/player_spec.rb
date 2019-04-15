require "rails_helper"

RSpec.describe Player do
  describe "initialization" do
    let(:player1) { Player.new(name: "Mack") }

    it "creates a player with the players name" do
      expect(player1.name).to eq("Mack")
    end

    it "has a default space of 1" do
      expect(player1.space).to eq(1)
    end

    it "can be initialized with a different space value" do
      player2 = Player.new(name: "Jack", space: 5)
      expect(player2.space).to eq(5)
    end

    it "can not be initialized with a space greater than 100" do
      expect{
        Player.new(name: "gone", space: 101)
      }.to raise_error(ArgumentError)
    end

    it "can not be initialized with a space less than 1" do
      expect {
        Player.new(name: "bad", space: 0)
      }.to raise_error(ArgumentError)
    end
  end

  describe "movement" do
    let(:player) { Player.new(name: "Mack", space: 5) }
    
    it "can move forward by a number of spaces" do
      player.move_forward(6)
      expect(player.space).to eq(11)
    end

    it "can move backward by a number of spaces" do
      player.move_backwards(4)
      expect(player.space).to eq(1)
    end

    it "can be sent to a specific space" do
      player.set_space(50)
      expect(player.space).to eq(50)
    end

    it "cannot be set to a space greater than 100" do
      expect { player.set_space(110) }.to raise_error(ArgumentError)
    end

    it "cannot be set to a space less than 1" do
      expect { player.set_space(0) }.to raise_error(ArgumentError)
    end
  end
end
