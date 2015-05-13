json.array!(@programmes) do |programme|
  json.extract! programme, :id, :name
  json.url programme_url(programme, format: :json)
end
