class Section < ActiveRecord::Base

	# name					:string 
	# description		:string 
	# order					:integer

	def self.next_order
		if Section.first.nil?
			return 0
		end
		Section.order(:order).last.order + 1
	end
end
