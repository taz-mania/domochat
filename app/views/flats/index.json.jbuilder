json.array!(@flats) do |flat|
  json.extract! flat, :id, :number, :floor, :entrance
  json.url flat_url(flat, format: :json)
end
