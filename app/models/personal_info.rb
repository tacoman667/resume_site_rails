class PersonalInfo < ActiveRecord::Base

	# name     :string 
	# city     :string 
	# state    :string 
	# zipcode  :string 
	# email    :string

	def self.info
		PersonalInfo.first
	end
end
