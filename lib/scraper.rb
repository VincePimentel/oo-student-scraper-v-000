require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(File.read(index_url))

    test = doc.css("div.student-card")

    students = Array.new

    doc.css("div.student-card").each do |student|
      students = {
        name: student.css("div.card-text-container h4").text,
        location: student.css("div.card-text.container p").text,
        profile_url: student.css("a").attribute("href").value
      }
    end

    students
    binding.pry
  end

  def self.scrape_profile_page(profile_url)

  end

end
