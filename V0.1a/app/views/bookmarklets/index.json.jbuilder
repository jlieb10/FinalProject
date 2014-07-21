json.array!(@bookmarklets) do |bookmarklet|
  json.extract! bookmarklet, :id
  json.url bookmarklet_url(bookmarklet, format: :json)
end
