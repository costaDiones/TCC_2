json.array!(@princes) do |prince|
  json.extract! prince, :id, :valueNormal, :valueAbove
  json.url prince_url(prince, format: :json)
end
