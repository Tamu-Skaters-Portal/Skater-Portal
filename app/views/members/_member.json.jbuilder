json.extract! member, :id, :name, :email, :points, :paid_status, :permission_id, :created_at, :updated_at
json.url member_url(member, format: :json)
