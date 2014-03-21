json.array!(@clientes) do |cliente|
  json.extract! cliente, :id, :nombre, :direccion, :ciudad, :giro, :rut
  json.url cliente_url(cliente, format: :json)
end
