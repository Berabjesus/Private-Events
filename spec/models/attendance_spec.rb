require 'rails_helper'
RSpec.describe Attendance, type: :model do
  context 'Association Test' do
    it 'ensures attendance has one attendee' do
      should belong_to(:attendee)
    end

    it 'ensures attendance has one attendee' do
      should belong_to(:attended_event)
    end
  end
end
