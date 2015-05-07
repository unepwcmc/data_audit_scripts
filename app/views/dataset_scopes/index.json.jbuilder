json.array!(@dataset_scopes) do |dataset_scope|
  json.extract! dataset_scope, :id, :name
  json.url dataset_scope_url(dataset_scope, format: :json)
end
