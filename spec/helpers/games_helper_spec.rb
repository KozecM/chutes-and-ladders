require "rails_helper"

RSpec.describe GamesHelper do
  describe "initialization" do
    let(:board) { GamesHelper.generate_spaces }

    it "Game helper creates board of size 100" do
      expect(board.size).to eq(100)
    end

    it "Spaces of the board are accessable" do
      expect(board.size).to eq(100)
    end

  end
  
end
