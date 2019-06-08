require "rails_helper"

RSpec.describe Dice do
  let(:dice) { Dice.new() }
  describe "rolling the dice" do
    it "returns a value less than or equal to 12 or 2 or greater" do
      expect(dice.roll).to be_between(2, 12)
    end

    it "always returns a value within the correct range" do
      rolls = []
      1000.times { rolls << dice.roll }
      expect(rolls).to all(be_between(2, 12))
    end

  end

  describe "setting the number of dice" do
    let(:dice) { Dice.new() }
    it "can be set to two dice" do
      dice.set_amount(2)
      expect(dice.get_amount).to eq(2)
    end

    it "can be set to a single dice" do
      dice.set_amount(1)
      expect(dice.get_amount).to eq(1)
    end

    it "returns a single dice roll within the correct range" do
      dice.set_amount(1)
      rolls = []
      1000.times {rolls << dice.roll}
      expect(rolls).to all(be_between(1,6))
    end

    it "throws an error for negative numbers" do
      expect{dice.set_amount(-1)}.to raise_error("Bad number")
    end

    it "throws and error for a positive number" do
      expect{dice.set_amount(4)}.to raise_error("Bad number")
    end
  end
end
