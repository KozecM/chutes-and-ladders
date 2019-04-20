require "rails_helper"

RSpec.describe Dice do
  describe "rolling the dice" do
    it "returns a value less than or equal to 12 or 2 or greater" do
      expect(Dice.roll).to be_between(2, 12)
    end
  end
end