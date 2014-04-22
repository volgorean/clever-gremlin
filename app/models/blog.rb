class Blog < ActiveRecord::Base
  validates :url, presence: true

  def webScrape(url)
    begin
      require 'open-uri'
      doc = Nokogiri::HTML(open(url))
    rescue
      return false
    end
  end
end
