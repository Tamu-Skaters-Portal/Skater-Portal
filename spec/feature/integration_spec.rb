require 'rails_helper'

# Example
RSpec.describe 'Creating a member', type: :feature do
  scenario 'valid inputs' do
    visit new_member_path
    fill_in 'Name', with: 'Nam Cao'
    fill_in 'Email', with: 'Email@email.com'
    fill_in 'Access type', with: 1
    fill_in 'Paid status', with: 25
    fill_in 'Points', with: 2
    
    
    click_on 'Create Member'
    visit members_path
    expect(page).to have_content('Nam Cao')
    expect(page).to have_content('Email@email.com')
    expect(page).to have_content('1')
    expect(page).to have_content('25')
    expect(page).to have_content('2')
    

  end
end