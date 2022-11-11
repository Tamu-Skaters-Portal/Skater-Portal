class Event < ApplicationRecord
     validates :date, presence: true
     validates :location, presence: true
     has_one :attendance

     def self.sign_in_page(current_member, current_event)
          if current_member 
               Attendance.create_attendance(current_member, current_event)
          else
               redirect_to('/auth/google_oauth2') # Alert they cannot sign in to the event without being signed in to their account
          end
     end

end
