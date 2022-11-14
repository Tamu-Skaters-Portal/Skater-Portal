class Member < ApplicationRecord
     validates :name, presence: true
     validates :email, presence: true
     validates :access_type, presence: true
     validates :paid_status, presence: true
     validates :points, presence: true

     validates :name, presence: true
     validates :email, presence: true
     validates :access_type, presence: true
     validates :paid_status, presence: true
     validates :points, presence: true

     has_one :finance
     has_many :attendances

     # attr_reader :access_type, :paid_status

     # https://stackoverflow.com/questions/10863084/omniauth-how-to-keep-user-logged-in-after-browser-is-closed
     before_save :generate_token
     def generate_token
          self.token = SecureRandom.urlsafe_base64
     end

     # https://medium.com/@amoschoo/google-oauth-for-ruby-on-rails-129ce7196f35
     def self.from_omniauth(auth)
          member = Member.find_by(email: auth.info.email)
          if member.nil?
               # Creates a new user only if it doesn't exist
               where(email: auth.info.email).first_or_initialize do |member|
                    member.name = auth.info.name
                    member.email = auth.info.email
                    member.points = 0
                    member.paid_status = 0
                    # This is changed to 1 for testing purposes, needs to be changed back later
                    member.access_type = 0
                    member.save
                    return member
               end
          end
          member
     end
end
