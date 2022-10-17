class SessionsController < ApplicationController
    def googleAuth
    # Get access tokens from the google server
    access_token = request.env["omniauth.auth"]
    #email_value = request.env["omniauth.email"]
    member = Member.from_omniauth(access_token)
    cookies.permanent[:token] = member.token
    #log_in(member)
    # Access_token is used to authenticate request made from the rails application to the google server
    #user.google_token = access_token.credentials.token
    # Refresh_token to request new access_token
    # Note: Refresh_token is only sent once during the first request
    #refresh_token = access_token.credentials.refresh_token
    #user.google_refresh_token = refresh_token if refresh_token.present?
    #user.save
    #member.email = access_token
    member.save
    redirect_to root_path
  end
end