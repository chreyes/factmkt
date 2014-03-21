json.array!(@facturas) do |factura|
  json.extract! factura, :id, :fecha
  json.url factura_url(factura, format: :json)
end
