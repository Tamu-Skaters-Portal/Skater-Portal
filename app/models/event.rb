class Event < ApplicationRecord
     validates :name, presence: true
     validates :date, presence: true
     validates :location, presence: true
     has_one :attendance

     def self.sign_in_page(current_member, current_event)
          # Compare date time, give a 60 minute period in which members can sign in
          # 1800 for 30 minutes to sign in before or after the event starts
          # 21600 for 6 hour offset that comes with utc time zone
          @time1 = DateTime.now.utc > current_event.date + 19_800
          @time2 = DateTime.now.utc < current_event.date + 23_400
          if current_member && @time1 && @time2
               Attendance.create_attendance(current_member, current_event)
               0
          elsif current_member
               1
          end
     end
end
