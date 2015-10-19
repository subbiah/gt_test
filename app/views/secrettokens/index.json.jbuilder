json.array!(@secrettokens) do |secrettoken|
  json.extract! secrettoken, :id, :code
  json.url secrettoken_url(secrettoken, format: :json)
end
