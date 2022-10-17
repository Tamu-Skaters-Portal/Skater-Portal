class Member < ApplicationRecord
    has_one :finance
    has_many :attendances

    #attr_reader :access_type, :paid_status

    #https://stackoverflow.com/questions/10863084/omniauth-how-to-keep-user-logged-in-after-browser-is-closed
    before_save :generate_token
    def generate_token
      self.token = SecureRandom.urlsafe_base64
    end

    def self.get_access_type(token)
      Rails.logger.debug("Member: #{self.find_by_token(token)}")
      member = self.find_by_token(token)
      if member
        return member.access_type
      else 
        return 0
      end
    end

    #https://medium.com/@amoschoo/google-oauth-for-ruby-on-rails-129ce7196f35
    def self.from_omniauth(auth)
      member = Member.find_by(email: auth.info.email)
      if member == nil
        # Creates a new user only if it doesn't exist
        where(email: auth.info.email).first_or_initialize do |member|
          member.name = auth.info.name
          member.email = auth.info.email
          member.points = 0
          member.paid_status = 0
          member.access_type = 0
          member.save
          return member
        end
      end
      member
    end
end
