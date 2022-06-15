class Link < ApplicationRecord
  validates :url, presence: true, url: true , uniqueness: true
  validates :description, presence: true, length: { in: 5..500 }
end
