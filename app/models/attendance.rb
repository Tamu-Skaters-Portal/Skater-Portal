class Attendance < ApplicationRecord
     validates :member, presence: true
     validates :event, presence: true
     belongs_to :member
     belongs_to :event

     def self.create_attendance(current_member, current_event)
          if Attendance.where(member: current_member, event: current_event).last.nil?
               @attendance = Attendance.new({ member: current_member, event: current_event })
               @attendance.save
          end
     end
end
