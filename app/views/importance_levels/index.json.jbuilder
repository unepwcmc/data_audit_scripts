json.array!(@importance_levels) do |importance_level|
  json.extract! importance_level, :id, :name
  json.url importance_level_url(importance_level, format: :json)
end
