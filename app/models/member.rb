class Member < ApplicationRecord
    validates :name, presence:true
    validates :email, presence:true
    validates :points, presence:true
    validates :paid_status, presence:true
    validates :permission_id, presence:true
end