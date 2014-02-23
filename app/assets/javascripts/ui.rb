Shoes.app do

	background "#EFC"
	border("#BE8",
	       strokewidth: 6)

	stack(margin: 12) do
	  para "Enter your name"
	  flow do
	    @line = edit_line
	    @btn = button "OK"
	  end
	end
end