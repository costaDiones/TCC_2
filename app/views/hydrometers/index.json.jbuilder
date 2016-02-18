json.array!(@hydrometers) do |hydrometer|
  json.extract! hydrometer, :id, :user_id
  json.url hydrometer_url(hydrometer, format: :json)
end
