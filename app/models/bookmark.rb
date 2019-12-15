class Bookmark < ApplicationRecord
  belongs_to :owner, class_name: "User"
  belongs_to :poi

  validates :owner, :poi, presence: true
end
