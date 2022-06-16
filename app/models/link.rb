# == Schema Information
#
# Table name: links
#
#  id          :integer          not null, primary key
#  url         :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Link < ApplicationRecord
  validates :url, presence: true, url: true, uniqueness: true
  validates :description, presence: true, length: { in: 5..500 }

  belongs_to :user, optional: true
  has_many :votes
end
