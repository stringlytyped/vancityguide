require 'test_helper'

class BookmarkTest < ActiveSupport::TestCase
  test "required bookmark attributes should not be empty" do
    bookmark = Bookmark.new
    assert bookmark.invalid?
    assert bookmark.errors[:owner].any?
    assert bookmark.errors[:poi].any?
  end
end
