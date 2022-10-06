class Attendance < ApplicationRecord
    has_many :members
    has_one :event
end
