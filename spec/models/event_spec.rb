require 'rails_helper'
RSpec.describe Event, type: :model do
  context "Presence validations tests" do
    it "ensures the title is present" do
      event = Event.new(description: "Some Content", date: Time.now, user_id: 21)
      expect(event.valid?).to eq(false)
    end

    it "Returns false when the Description is not present" do
      event = Event.new(title: "Some Content", date: Time.now, user_id: 21)
      expect(event.valid?).to eq(false)
    end

    it "ensures the date is present" do
      event = Event.new(title: "title", description: "Some Content", user_id: 21)
      expect(event.valid?).to eq(false)
    end

    it "ensures the user_id is present" do
      event = Event.new(title: "title", description: "Some Content", date: Time.now)
      expect(event.valid?).to eq(false)
    end
  end

  context "Valid user id  test" do
    it "ensures the user who post the event exists" do
      event = Event.new(title: "title", description: "Some Content", date: Time.now, user_id: 2100)
      expect(event.valid?).to eq(false)
    end
  end
end