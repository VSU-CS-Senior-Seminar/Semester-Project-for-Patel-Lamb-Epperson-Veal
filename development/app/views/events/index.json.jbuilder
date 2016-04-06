json.array!(@events) do |event|
  json.extract! event, :id, :name, :description, :tart_at, :end_time
  json.url event_url(event, format: :json)
end
