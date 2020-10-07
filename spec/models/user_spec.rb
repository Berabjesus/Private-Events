require 'rails_helper'
RSpec.describe User, type: :model do
  context 'Association Test' do
    it 'ensures user has many events' do
      should have_many(:events)
    end

    it 'ensures user has many attendances' do
      should have_many(:attended_events).through(:attendances)
    end

    it 'ensures user has many events' do
      should have_many(:attendances)
    end
  end

  context 'Presence validations tests' do
    it 'ensures the passwords match is present' do
      user = User.new(username: 'sdfsd', password: 'Some Content', password_confirmation: 'Some')
      expect(user.save).to eq(false)
    end

    it 'returns false if the username is not present' do
      user = User.new(password: 'Some Content', password_confirmation: 'Some')
      expect(user.valid?).to eq(false)
    end

    it 'returns false if the password is not present' do
      user = User.new(username: 'Some Content', password_confirmation: 'Some')
      expect(user.valid?).to eq(false)
    end
  end
end
