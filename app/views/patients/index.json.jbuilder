json.array!(@patients) do |patient|
  json.extract! patient, :id, :name, :age, :identification, :modality, :catheter, :caliber
  json.url patient_url(patient, format: :json)
end
