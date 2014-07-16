json.array!(@apartments) do |apartment|
  json.extract! apartment, :id, :street, :unit, :city, :state, :zip, :link, :contact, :price, :hunt_id
  json.url apartment_url(apartment, format: :json)
end
