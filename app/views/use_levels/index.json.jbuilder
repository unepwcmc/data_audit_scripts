json.array!(@use_levels) do |use_level|
  json.extract! use_level, :id, :name
  json.url use_level_url(use_level, format: :json)
end
