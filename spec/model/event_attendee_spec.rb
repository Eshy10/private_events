require 'rails_helper'

RSpec.describe EventAttendee, :type => :model do
  describe "Associations" do
    it { should belong_to(:event) }
    it { should belong_to(:attendee) }  
  end
end