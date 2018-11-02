require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(File.read(index_url))

    test = doc.css("div.student-card")

    students = Array.new

    doc.css("div.roster-cards-container").each do |student|
      students = [
        name: student.css("div.student-card h4.student-name").text,
        location: student.css("div.student-card p.student-location").text,
        profile_url: student.css("div.student-card a").attribute("href").value
      ]
    end

    students
    #binding.pry
  end

  def self.scrape_profile_page(profile_url)

  end

end
