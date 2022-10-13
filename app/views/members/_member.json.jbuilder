json.extract! member, :id, :name, :email, :points, :paid_status, :access_type, :created_at, :updated_at
json.url member_url(member, format: :json)
