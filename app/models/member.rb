class Member < ApplicationRecord
    has_one :finance
    has_many :attendances
end
