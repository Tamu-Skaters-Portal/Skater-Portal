class Member < ApplicationRecord
    has_one :finance
    has_many :attendances

    #https://www.mintbit.com/blog/social-login-in-ruby-on-rails-with-google
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[github google_oauth2]

    #https://medium.com/@amoschoo/google-oauth-for-ruby-on-rails-129ce7196f35
    def self.from_omniauth(auth)
        # Creates a new user only if it doesn't exist
        where(email: auth.info.email).first_or_initialize do |member|
          member.name = auth.info.name
          member.email = auth.info.email
          member.points = 0
          member.paid_status = "not paid"
          member.access_type = 0
        end
      end
end
