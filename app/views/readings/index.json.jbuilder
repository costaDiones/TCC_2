json.array!(@readings) do |reading|
  json.extract! reading, :id, :date_reading, :reading, :hydrometer_id
  json.url reading_url(reading, format: :json)
end
