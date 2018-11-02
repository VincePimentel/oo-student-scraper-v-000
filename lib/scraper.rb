require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(File.read(index_url))
    student_card = doc.css("div.student-card")
    binding.pry
  end

  def self.scrape_profile_page(profile_url)

  end

end
