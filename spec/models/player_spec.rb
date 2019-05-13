require "rails_helper"

RSpec.describe Player do
  let(:player1) { FactoryBot.build_stubbed(:mack) }
  let(:moves_around) { FactoryBot.create(:mack, position: 5) }
  let(:bad_player) { FactoryBot.build_stubbed(:bad_player) }
  let(:nil_player) { FactoryBot.build_stubbed(:nil_player) }

  describe "initialization" do
    it "creates a player with the players name" do
      expect(player1).to have_name("Mack")
    end

    it "can be initialized with a different position value" do
      expect(moves_around).to have_position(5)
    end

    it "isn't a valid player if its name is blank" do
      expect(bad_player).not_to be_valid
      expect(bad_player.errors[:name]).to eq(["can't be blank"])
    end

    it "isn't a valid player if the name is nil" do
      expect(nil_player).to have_name(nil)
      expect(nil_player).not_to be_valid
      expect(nil_player.errors[:name]).to eq(["can't be blank"])
    end
  end

  describe "movement" do    
    it "can move forward by a number of positions" do
      moves_around.move(6)
      expect(moves_around).to have_position(11)
    end

    it "can move backward by a number of positions" do
      moves_around.move(-4)
      expect(moves_around).to have_position(1)
    end

    it "can be sent to a specific position" do
      moves_around.set_position(50)
      expect(moves_around).to have_position(50)
    end

    it "won't move the player above a space of 100" do
      moves_around.set_position(90)
      expect(moves_around).to have_position(90)
      moves_around.move(11)
      expect(moves_around).not_to have_position(101)
    end

    it "won't set the position below a space of 1" do
      moves_around.set_position(1)
      expect(moves_around).to have_position(1)
      moves_around.move(-5)
      expect(moves_around).not_to have_position(-4)
    end
  end

end
