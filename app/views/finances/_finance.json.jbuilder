json.extract!(finance, :id, :member_id, :amount, :created_at, :updated_at)
json.url(finance_url(finance, format: :json))
