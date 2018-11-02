require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(File.read(index_url))

    test = doc.css("div.student-card")

    students = Hash.new

    doc.css("div.student-card").each do |student|
      student_key = student.css("h4.student-name").text.downcase.gsub(" ", "_")
      students[student_key.to_sym] = [
        name: student.css("h4.student-name").text,
        location: student.css("p.student-location").text,
        profile_url: student.css("a").attribute("href").value
      ]
    end

    students
    #binding.pry
  end

  def self.scrape_profile_page(profile_url)

  end

end
