json.array!(@items) do |item|
  json.extract! item, :id, :cantidad, :detalle, :precio
  json.url item_url(item, format: :json)
end
