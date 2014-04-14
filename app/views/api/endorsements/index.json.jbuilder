json.array!(@endorsements) do |endorsement|
	json.partial!("api/endorsements/endorsement", :endorsement => endorsement)
end