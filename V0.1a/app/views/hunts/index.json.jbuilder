json.array!(@hunts) do |hunt|
  json.extract! hunt, :id, :title
  json.url hunt_url(hunt, format: :json)
end
