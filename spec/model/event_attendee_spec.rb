require 'rails_helper'

RSpec.describe EventAttendee, type: :model do
  context 'Association' do
    it 'should belong to event' do
      t = EventAttendee.reflect_on_association(:event)
      expect(t.macro).to eq(:belongs_to)
    end
    it 'should belong to attendee' do
      t = EventAttendee.reflect_on_association(:attendee)
      expect(t.macro).to eq(:belongs_to)
    end
  end
end
