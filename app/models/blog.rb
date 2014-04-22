class Blog < ActiveRecord::Base
  validates :url, presence: true
end
