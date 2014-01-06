json.array!(@pins) do |pin|
  json.extract! pin, :id, :index, :show, :edit, :delete
  json.url pin_url(pin, format: :json)
end
