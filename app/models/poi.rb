class Poi < ApplicationRecord
  belongs_to :owner, class_name: "User"
  
  enum category: [:restaurant, :nature, :museum, :nightlife, :outdoor_activity, :shopping, :landmark]

  validates :name, :owner, :category, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 1,
                                     less_than_or_equal_to: 5 },
                     allow_nil: true
  validates :website, url: true

  has_many :bookmarks, dependent: :destroy
end
