class Section < ActiveRecord::Base

	# name					:string 
	# description		:string 
	# order					:integer, base 0

	validates :name, :description, :order, presence: true

	def self.next_order
		if Section.first.nil?
			return 0
		end
		Section.order(:order).last.order + 1
	end

	def self.reorder_sections
		sections = order(:order)
		count = 0
		sections.each do |s|
			s.order = count
			s.save
			count += 1
		end
	end

	def move_up
		self.order = self.order - 1
		section = Section.where(order: self.order).first
		unless section.nil?
			section.order = order + 1
			section.save
		end
		return save
	end

	def move_down
		self.order = self.order + 1
		section = Section.where(order: self.order).first
		unless section.nil?
			section.order = order - 1
			section.save
		end
		return save
	end

	def is_first?
		first_section = Section.order(:order).first
		if first_section.nil?
			return false
		end
		return self.id == first_section.id
	end

	def is_last?
		last_section = Section.order(:order).last
		if last_section.nil?
			return false
		end
		return self.id == last_section.id
	end
end
