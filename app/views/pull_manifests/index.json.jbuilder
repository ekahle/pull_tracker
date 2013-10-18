json.array!(@pull_manifests) do |pull_manifest|
  json.extract! pull_manifest, :file
  json.url pull_manifest_url(pull_manifest, format: :json)
end
