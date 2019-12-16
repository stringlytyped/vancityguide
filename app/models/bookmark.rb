##
# Defines the Bookmark model. Bookmarks have the following attributes:
#
# +owner_id+::  foreign key (+User+ model)
# +poi_id+::  foreign key (+Poi+ model)
#
class Bookmark < ApplicationRecord
  belongs_to :owner, class_name: "User"
  belongs_to :poi

  validates :owner, :poi, presence: true
end
