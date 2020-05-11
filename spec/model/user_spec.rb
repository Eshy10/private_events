require 'rails_helper'

RSpec.describe User, :type => :model do
    subject {
        described_class.new(name: 'Theo')
    }

    it 'is valid with valid name' do
        expect(subject).to be_valid
    end
    
    it "is not valid without a name" do
        subject.name = nil
        expect(subject).to_not be_valid
    end

  describe "Associations" do
    it { should have_many(:created_events) }
    it { should have_many(:event_attendees) } 
    it { should have_many(:attending_events) }  
  end
end