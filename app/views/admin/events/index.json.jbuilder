json.array!(@events) do |event|
  json.extract! event, :id, :venue_id, :dj_id, :promoter_id, :photo,, :date
  json.url event_url(event, format: :json)
end
