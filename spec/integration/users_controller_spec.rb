require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  describe 'Creates a new user' do
    it 'Should create a new User' do
      visit new_user_path
      fill_in 'user_username', with: 'Test'
      fill_in 'user_password', with: '123'
      fill_in 'user_password_confirmation', with: '123'
      find("input[type='submit']").click
      expect(page).to have_content(/Sign up successful, login using your credentials/)
    end
  end
end
