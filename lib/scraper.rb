require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper
#attr_accessor :name, :location, :profile_url, :students
#is a class method that scrapes the student index page ('./fixtures/student-site/index.html') and a returns an array of hashes in which each hash represents one student
  def self.scrape_index_page(index_url)
    html = File.read("fixtures/student-site/index.html")
    students_index = Nokogiri::HTML(html)
    #binding.pry
    students = []
      students_index.css("div.student-card").each do |student_card|
        #name = student_card.css("h4.student-name").text
        #binding.pry
        students << {
          :name => student_card.css("h4.student-name").text,
          :location => student_card.css("p.student-location").text,
          #:profile_url => "fixtures/student-site/#{student_card.css("a").attribute("href").text}" works for all but 3 for some reason
          :profile_url => student_card.css("a").attribute("href").text
        }
        #binding.pry
      end
      #binding.pry
      students
  end #self.scrape_index_page


#is a class method that scrapes a student's profile page and returns a hash of attributes describing an individual student
#can handle profile pages without all of the social links
  def self.scrape_profile_page(profile_url)

  end #self.scrape_profile_page

end #SCRAPER CLASS
