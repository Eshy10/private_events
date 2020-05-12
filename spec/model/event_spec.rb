require 'rails_helper'

RSpec.describe Event, :type => :model do
  context 'validation test' do
    it 'ensures first name presence' do
      event = Event.new(date: Date.today, title: 'happy', location: 'lagos', description: 'stay happy').save
      expect(event).to eq(false)
    end
  end

  context 'Association' do
  it "should have many created_events" do
    t = Event.reflect_on_association(:creator)
    expect(t.macro).to eq(:belongs_to)
  end
it "should have many event_attendees" do
    t = Event.reflect_on_association(:event_attendees)
    expect(t.macro).to eq(:has_many)
  end
it "should have many attending_events" do
    t = Event.reflect_on_association(:attendees)
    expect(t.macro).to eq(:has_many)
  end
end
end
