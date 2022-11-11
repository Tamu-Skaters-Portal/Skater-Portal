class Finance < ApplicationRecord
     validates :member, presence: true
     validates :amount, presence: true
     belongs_to :member

     # This is meant to allow for members to be deleted, but keep the financial records of them
     def self.show_member(finance)
          if Member.where(id: finance.member_id).last != nil
               return Member.where(id: finance.member_id).last.name
          else
               return 'No current member associated'
          end
     end

     # GET a sum of all the money in the finances table
     def self.sum_finance
          return Finance.sum(:amount)
     end
end
