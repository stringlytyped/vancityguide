class Poi < ApplicationRecord
  belongs_to :owner, class_name: "User"
  
  enum category: [:restaurant, :nature, :museum, :nightlife, :outdoor_activity, :shopping, :landmark]

  validates :name, :owner, :category, presence: true
  validates :website, url: true
  validates :rating, numericality: { greater_than_or_equal_to: 1,
                                     less_than_or_equal_to: 5 },
                     allow_nil: true
  validates :lat, numericality: { greater_than_or_equal_to: -90,
                                  less_than_or_equal_to: 90 },
                  allow_nil: true
  validates :lon, numericality: { greater_than_or_equal_to: -180,
                                  less_than_or_equal_to: 180 },
                  allow_nil: true
  
  has_many :bookmarks, dependent: :destroy
  attribute :featured, :boolean, default: false
end
