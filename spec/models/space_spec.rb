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

end
