require "rails_helper"

RSpec.describe Board do
  describe "initialize a board" do
    let(:board) { Board.new }

    it "creates a board with 100 spaces" do
      expect(board.spaces.count).to eq(100)
    end

    it "spaces are not accessable directly" do
      expect(board.space_destination(2)).to eq(38)
      expect(board.space_type(2)).to eq("ladder")
    end
  end

end