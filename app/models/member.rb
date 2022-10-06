class Member < ApplicationRecord
    belongs_to :finance
    belongs_to :attendance
end
