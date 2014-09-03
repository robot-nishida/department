json.array!(@schools) do |school|
  json.extract! school, :id, :name, :url
  json.url school_url(school, format: :json)
end
