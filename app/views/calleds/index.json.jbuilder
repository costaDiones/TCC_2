json.array!(@calleds) do |called|
  json.extract! called, :id, :affair, :datescheduling, :typecalled, :description, :user_id
  json.url called_url(called, format: :json)
end
