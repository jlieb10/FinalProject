json.array!(@details) do |detail|
  json.extract! detail, :id, :content, :procon, :apartment_id
  json.url detail_url(detail, format: :json)
end
