require 'rails_helper'

# Example
# def mockoatuh
#   OmniAuth.config.test_mode = true
#   OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
#   })
# end


#TODO: Fix this test to mock google oauth in order to go to /members page

# RSpec.describe('Creating a member', type: :feature) do
#      it 'valid inputs' do
#           # mockoauth
#           visit new_member_path #going to /members page

#           # filling out the new member details
#           fill_in 'Name', with: 'Nam Cao'
#           fill_in 'Email', with: 'Email@email.com'
#           fill_in 'Access type', with: 1
#           fill_in 'Paid status', with: 25
#           fill_in 'Points', with: 2

#           # clicking on the create member button
#           click_on 'Create Member'
          
#           visit members_path # visiting the member table page

#           # checking to see if the page has expected content
#           expect(page).to(have_content('Nam Cao'))
#           expect(page).to(have_content('Email@email.com'))
#           expect(page).to(have_content('1'))
#           expect(page).to(have_content('25'))
#           expect(page).to(have_content('2'))
#      end
# end

RSpec.describe('Creating an Event', type: :feature) do
     it 'valid inputs' do
          visit new_event_path
          fill_in 'Date', with: '2022-10-18 03:00:00'
          fill_in 'Location', with: 'Nam house'

          click_on 'Create Event'
          visit events_path
          expect(page).to(have_content('2022-10-18 03:00:00 UTC'))
          expect(page).to(have_content('Nam house'))
     end
end

RSpec.describe('Creating an Attendance', type: :feature) do
     it 'valid inputs' do
          visit new_member_path
          fill_in 'Name', with: 'Nam Cao'
          fill_in 'Email', with: 'Email@email.com'
          fill_in 'Access type', with: 1
          fill_in 'Paid status', with: 25
          fill_in 'Points', with: 2

          click_on 'Create Member'

          visit new_event_path
          fill_in 'Date', with: '2022-10-18 03:00:00'
          fill_in 'Location', with: 'Nam house'

          click_on 'Create Event'

          visit new_attendance_path
          select 'Nam Cao', from: 'Member'
          select 'Nam house', from: 'Event'

          click_on 'Create Attendance'
          visit attendances_path
          expect(page).to(have_content('Nam Cao'))
          expect(page).to(have_content('Nam house'))
     end
end

# most updated finance table integration test check
# RSpec.describe('Creating a Finance', type: :feature) do
#      it 'valid inputs' do
#           visit new_member_path
#           fill_in 'Name', with: 'Nam Cao'
#           fill_in 'Email', with: 'Email@tamu.edu'
#           fill_in 'Access type', with: 1
#           fill_in 'Paid status', with: 25
#           fill_in 'Points', with: 2

#           click_on 'Create Member'

#           # visit

#           # visit '/auth/google_oauth2'

#           visit new_finance_path
#           select 'Nam Cao', from: 'Member'
#           fill_in 'Amount', with: 25

#           click_on 'Create Finance'

#           visit finances_path
#           expect(page).to have_content('Nam Cao')
#           expect(page).to have_content('25')
#      end
# end

#older version of finances table test
# RSpec.describe 'Creating a Finance', type: :feature do
#      scenario 'valid inputs' do
#      visit new_member_path
#      fill_in 'Name', with: 'Nam Cao'
#      fill_in 'Email', with: 'Email@tamu.edu'
#      fill_in 'Access type', with: 1
#      fill_in 'Paid status', with: 25
#      fill_in 'Points', with: 2

#      click_on 'Create Member'
#      visit
#      visit '/auth/google_oauth2'
#      visit new_finance_path
#      select 'Nam Cao', from: 'Member'
#      fill_in 'Amount', with: 25

#      click_on 'Create Finance'
#      visit finances_path
#      expect(page).to have_content('Nam Cao')
#      expect(page).to have_content('25')

#      end
# end
