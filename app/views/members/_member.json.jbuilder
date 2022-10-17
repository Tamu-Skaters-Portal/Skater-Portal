json.extract! member, :id, :name, :email, :token, :access_type, :paid_status, :points, :created_at, :updated_at
json.url member_url(member, format: :json)
