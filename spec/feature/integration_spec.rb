require 'rails_helper'

# Example
RSpec.describe 'Creating a member', type: :feature do
  scenario 'valid inputs' do
    visit new_member_path
    fill_in 'Name', with: 'Nam Cao'
    fill_in 'Email', with: 'Email@email.com'
    fill_in 'Points', with: 2
    page.check('Paid status')
    fill_in 'Permission', with: 1
    click_on 'Create Member'
    visit members_path
    expect(page).to have_content('Nam Cao')
    expect(page).to have_content('Email@email.com')
    expect(page).to have_content('2')
    expect(page).to have_content('true')
    expect(page).to have_content('1')

  end
end
