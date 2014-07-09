module ApartmentsHelper
	def apartment_path_helper(hunt, apartment)
		if hunt
			[:hunt, @apartment]
		else
			@apartment
		end
	end
end
