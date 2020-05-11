class User < ApplicationRecord
    has_many :created_events, class_name: 'Event', foreign_key: :creator_id
    has_many :event_attendees, foreign_key: 'attendee_id'
    has_many :attending_events, through: :event_attendees, source: :event
    validates :name, presence: true
end
