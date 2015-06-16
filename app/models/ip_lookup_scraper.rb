class IpLookupScraper

	URL = "http://www.iptrackeronline.com/?ip_address="

	attr_accessor :ip_address, :organization, :isp, :host_name, :city, :state, :country, :area_code


	def initialize(ip_address)
		require 'rubygems'
		require 'nokogiri'
		require 'open-uri'

		doc = Nokogiri::HTML(open(URL + ip_address))

		tbl = doc.search('table:contains("Information about ipaddress")')

		@ip_address = ip_address
		@organization = get_value_from_cell('Organization', tbl)
		@isp = get_value_from_cell('ISP', tbl)
		@host_name = get_value_from_cell('Hostname', tbl)
		@city = get_value_from_cell('City', tbl)
		@state = get_value_from_cell('Region (code)', tbl)
		@country = get_value_from_cell('Country', tbl)
		@area_code = get_value_from_cell('Areacode', tbl)
	end

	def get_value_from_cell(name, tbl)
		selector = "td:contains('#{name}') input"
		val = tbl.search(selector).attr('value').value
	  if val.blank?
	  	return 'N/A'
	  else
	  	return val
	  end
	end
end