class Blog < ActiveRecord::Base
  require 'open-uri'
  validates :url, presence: true

  def web_scrape(url)
    begin
      doc = Nokogiri::HTML(open(url))
      text  = doc.at('body').inner_text
    rescue
      return false
    end
  end

  def text_to_words(text)
    words = text.scan(/[a-z]+/i)
  end

  def word_size_over_time(text)
     paragraphs = text.split(/[0-9]{2}[,|\/|\\| |]( )?[0-9]{4}/)
     fixed = []
     paragraphs.each do |para|
      fixed << text_to_words(para).join(" ")
     end
     fixed
  end

  # returns an array of words by their useage in an array ..eg.. [["blabla", 6],["hai", 2],["lolwut", 1]]
  def wordCount(words)
    words.group_by(&:downcase).map{ |word,instances|
      [word,instances.length]
    }.sort_by(&:last).reverse
end
end
