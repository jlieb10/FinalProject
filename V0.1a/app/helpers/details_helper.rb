module DetailsHelper
	def detail_path_helper(apartment, detail)
		if apartment
			[:apartment, @detail]
		else
			@detail
		end
	end
end
