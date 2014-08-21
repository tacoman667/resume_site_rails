class PersonalInfo < ActiveRecord::Base

	# name     :string 
	# city     :string 
	# state    :string 
	# zipcode  :string 
	# email    :string

	validates :name, :city, :state, :zipcode, :email, presence: true

	def self.info
		PersonalInfo.first
	end
end
