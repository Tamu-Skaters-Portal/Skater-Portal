class Event < ApplicationRecord
     validates :date, presence: true
     validates :location, presence: true
     has_one :attendance
end
