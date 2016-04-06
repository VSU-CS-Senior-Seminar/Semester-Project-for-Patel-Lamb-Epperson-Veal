json.array!(@events) do |event|
  json.extract! event, :id, :name, :description, :tart_at, :end_at
  json.url event_url(event, format: :json)
end
