json.array!(@pull_lists) do |pull_list|
  json.extract! pull_list, :file
  json.url pull_list_url(pull_list, format: :json)
end
