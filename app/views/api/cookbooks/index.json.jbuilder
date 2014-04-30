json.array!(@cookbooks) do |cookbook|
	json.partial!("api/cookbooks/cookbook", :cookbook => cookbook)
end