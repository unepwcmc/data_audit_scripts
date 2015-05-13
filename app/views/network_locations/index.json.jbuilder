json.array!(@network_locations) do |network_location|
  json.extract! network_location, :id, :path, :drive_id
  json.url network_location_url(network_location, format: :json)
end
