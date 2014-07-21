require 'nokogiri'
require 'open-uri'
require 'mechanize'

class Bookmarklet

	def initialize(url)
		@url = url
		@images = []
	end

	def run 
		@doc = Nokogiri::HTML(open(@url))
		scrape_images
		scrape_rent
		scrape_neighborhood
		scrape_contact
		create_apartment
	end

	def scrape_images
		@doc.css('#thumbs a').each do |thumb|
    	@images << thumb['href']
		end
	end

	def scrape_rent
		@rent = @doc.at_css('.postingtitle').text.match(/\b\d+\b/)
	end

	def scrape_neighborhood
		@neighborhood = @doc.at_css('.postingtitle').text.match(/\(.+/)[0].gsub(/\(|\)/, "")
	end

	def scrape_contact
		agent = Mechanize.new
		agent.get(@url)
		new_page = agent.page.link_with(:text => "show contact info")

		if new_page != nil
		    @number = new_page.click.body.match(/\d.?.?\d.?.?\d.?.?\d.?.?\d.?.?\d/)[0]
		else
		    @number = "See Craiglist page for contact info!"
		end
	end

	def create_apartment
		@apartment = Apartment.new()
	end
end
