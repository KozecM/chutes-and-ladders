require "rails_helper"

RSpec.describe Player do
  let(:player1) { FactoryBot.build_stubbed(:player) }
  let(:moves_around) { FactoryBot.create(:player, position: 5) }
  let(:starts_at_fifth) { FactoryBot.build_stubbed(:starts_at_fifth_position) }
  let(:bad_player) { FactoryBot.build_stubbed(:bad_player) }
  let(:nil_player) { FactoryBot.build_stubbed(:nil_player) }

  describe "initialization" do
    it "creates a player with the players name" do
      expect(player1).to have_name("FAKE PLAYER")
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

  describe "using the big dependency" do
    # This takes a super long time :(
      # it "returns a message that says 'we done'" do
      #   big_guy = BigDependency.new
      #   expect(player1.perform(big_guy)).to eq('we done')
      # end

    # This uses a FakeBigDependency that responds to the same methods
    it "returns a message that says 'we done'" do
      class FakeBigDependency
        def execute
          'ZZzzzzzzzzzzz.....finished sleeping!'
        end
      end

      fake_big_guy = FakeBigDependency.new
      expect(player1.perform(fake_big_guy)).to eq('we done')
    end

    it "returns a message that says 'we done' using a stub" do
      big_dependency = BigDependency.new
      allow(big_dependency).to receive(:execute).and_return("i'm tired")
      expect(player1.perform(big_dependency)).to eq('we done')
    end

    it "returns a message that says 'we done' using a mock" do
      
    end

  end

end
