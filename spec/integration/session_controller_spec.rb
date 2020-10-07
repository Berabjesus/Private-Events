require 'rails_helper'

RSpec.describe 'Sessions', type: :feature do
  describe 'Logges a user in' do
    user = User.new(username: 'test', password: '123')
    user.save
    it 'Should login a User' do
      visit new_session_path
      fill_in 'username', with: 'test'
      fill_in 'password', with: '123'
      find("input[type='submit']").click
      expect(page).to have_content(/Upcoming events/)
    end

    it 'Should show not allow user to login' do
      visit new_session_path
      fill_in 'username', with: 'test123'
      fill_in 'password', with: '123123'
      find("input[type='submit']").click
      expect(page).to have_content(/You are not signed up!/)
    end

    it 'Should redirect to signup page' do
      visit new_session_path
      find('.btn-link').click
      expect(page).to have_content(/Sign Up/)
    end
  end
end
