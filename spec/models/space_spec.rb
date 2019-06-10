require "rails_helper"

RSpec.describe Space do
  describe "initialize empty space" do
    let(:space) { Space.new(space_type: "empty") }

    it "creates a space of type empty" do
      expect(space.space_type).to eq("empty")
    end

    it "destination of empty space is nil" do
      expect(space.destination).to eq(nil)
    end
  end

  describe "initialize chute space" do
    let(:space) { Space.new(space_type: "chute", destination: 1) }

    it "creates a space of type chute" do
      expect(space.space_type).to eq("chute")
    end

    it "destination of chute space is 1" do
      expect(space.destination).to eq(1)
    end
  end

  describe "initialize ladder space" do
    let(:space) { Space.new(space_type: "ladder", destination: 90) }

    it "creates a space of type ladder" do
      expect(space.space_type).to eq("ladder")
    end

    it "destination of ladder space is 90" do
      expect(space.destination).to eq(90)
    end
  end

  describe "initializing bad spaces" do
    let(:space) { Space.new(space_type: space_type, destination: destination)}

    describe "doesn't accept a space with a bad destination" do

      let(:space_type) { "empty" }
      let(:destination) { -1 }
      specify {expect{space.check_destination}.to raise_error("Error, Can't do negative number for a destination")}
    end

    describe "doesn't accept a space with an incorrect type" do
      let(:space_type) { "BAD_VALUE" }
      let(:destination) { 1 }
      specify {expect{space.check_type}.to raise_error("Error, incorrect type, can only be: empty, ladder, chute")}
    end
  end
end
