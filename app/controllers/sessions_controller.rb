class SessionsController < ApplicationController
  def google_auth
    access_token = request.env["omniauth.auth"]
    member = Member.from_omniauth(access_token)
    cookies.permanent[:token] = member.token

    redirect_to root_path
  end
end