class Finance < ApplicationRecord
     validates :member, presence: true
     validates :amount, presence: true
     belongs_to :member
end
