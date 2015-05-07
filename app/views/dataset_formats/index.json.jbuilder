json.array!(@dataset_formats) do |dataset_format|
  json.extract! dataset_format, :id, :name
  json.url dataset_format_url(dataset_format, format: :json)
end
