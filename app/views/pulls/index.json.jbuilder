json.array!(@pulls) do |pull|
  json.extract! pull, :name, :status, :target_completion_date, :description, :file, :investigator, :requester, :pull_list_maker, :lab_contact_name, :notes_for_lab, :has_mta, :has_budget, :accepted_consent_to_long_term_storage, :accepted_emory_specimens, :accepted_cold_chain_quality, :accepted_specimen_quality
  json.url pull_url(pull, format: :json)
end
