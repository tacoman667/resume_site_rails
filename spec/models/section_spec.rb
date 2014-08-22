require 'spec_helper'

describe Section do
	before(:each) do
		# nothing yet
	end

  it 'should reorder sections' do
  	create(:section, order: 0)
		create(:section, order: 4)
		create(:section, order: 3)

		Section.reorder_sections

		count = 0
		Section.order(:order).each do |s|
			s.order.should eq(count)
			count += 1
		end
	end

	it 'should move up section' do
		s1 = create(:section, order: 0)
		s2 = create(:section, order: 1)
		create(:section, order: 2)

		s2.move_up

		s1.reload
		s2.reload

		s1.order.should eq(1)
		s2.order.should eq(0)
	end

	it 'should move down section' do
		create(:section, order: 0)
		s1 = create(:section, order: 1)
		s2 = create(:section, order: 2)

		s1.move_down

		s1.reload
		s2.reload

		s1.order.should eq(2)
		s2.order.should eq(1)
	end	
end
