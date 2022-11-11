class Attendance < ApplicationRecord
     validates :member, presence: true
     validates :event, presence: true
     belongs_to :member
     belongs_to :event
end
