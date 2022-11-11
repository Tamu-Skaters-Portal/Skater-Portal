class Event < ApplicationRecord
     validates :date, presence: true
     validates :location, presence: true
     has_one :attendance

     def self.sign_in_page(current_member, current_event)
          # Compare date time, give a 60 minute period in which members can sign in
          # 1800 for 30 minutes to sign in before or after the event starts
          # 21600 for 6 hour offset that comes with utc time zone
          if current_member && DateTime.now.utc > current_event.date + 19800 && DateTime.now.utc < current_event.date + 23400 
               Attendance.create_attendance(current_member, current_event)
          else
               # Alert they cannot sign in to the event without being signed in to their account
               #redirect_to('../../auth/google_oauth2') 
               return nil
          end
     end

end
