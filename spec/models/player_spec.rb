require "rails_helper"

RSpec.describe Player do
  let(:valid_player) { FactoryBot.build_stubbed(:player) }
  let(:nameless_player) { FactoryBot.build_stubbed(:nameless_player) }
  let(:nil_player) { FactoryBot.build_stubbed(:nil_player) }
  let(:moves_around) { FactoryBot.create(:player, position: 5) }
  let(:starts_at_fifth) { FactoryBot.build_stubbed(:starts_at_fifth_position) }

  describe "Initialized players are valid" do
    it "Players are initialized with a valid name" do
      expect(valid_player).to have_name("FAKE PLAYER")

      expect(valid_player).to be_valid
    end

    it "Players are initialized with a valid positiong of one" do
      expect(valid_player).to have_position(1)

      expect(valid_player).to be_valid
    end
  end

  describe "Player validation" do
    it "isn't a valid player if its name is blank" do
      expect(nameless_player).to have_name("")

      expect(nameless_player).not_to be_valid
      expect(nameless_player.errors[:name]).to eq(["can't be blank"])
    end

    it "isn't a valid player if the name is nil" do
      expect(nil_player).to have_name(nil)

      expect(nil_player).not_to be_valid
      expect(nil_player.errors[:name]).to eq(["can't be blank"])
    end

    it "Invalid if a player has a position that isn't an integer" do
      valid_player.position = 0.5

      expect(valid_player).not_to be_valid
      expect(valid_player.errors[:position]).to eq(["must be an integer"])
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
