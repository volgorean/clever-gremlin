class Blog < ActiveRecord::Base
  require 'open-uri'
  validates :url, presence: true

  def webScrape(url)
    begin
      doc = Nokogiri::HTML(open(url))
      text  = doc.at('body').inner_text
      words = text.scan(/[a-z]+/i)
    rescue
      return false
    end
  end

  # returns an array of words by their useage in an array ..eg.. [["blabla", 6],["hai", 2],["lolwut", 1]]
  def wordCount(words)
    words.group_by(&:downcase).map{ |word,instances|
      [word,instances.length]
    }.sort_by(&:last).reverse
end
end
