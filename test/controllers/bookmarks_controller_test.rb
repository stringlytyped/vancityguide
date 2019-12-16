require 'test_helper'

class BookmarksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @bookmark = bookmarks(:one)
    sign_in users(:admin)
  end

  test "should get index" do
    get bookmarks_url
    assert_response :success

    assert_select 'title', 'My bookmarks'
    assert_select 'h1', 'My bookmarks'
    # One POI should be displayed because users(:admin) has one bookmark associated
    assert_select "article.poi-tile"
  end

  test "should create bookmark" do
    assert_difference('Bookmark.count') do
      post bookmarks_url, params: { bookmark: { poi_id: pois(:two).id } }
    end

    assert_redirected_to poi_url(pois(:two))
  end

  test "should show bookmark" do
    get bookmark_url(@bookmark)
    assert_redirected_to poi_url(@bookmark.poi)
  end

  test "should destroy bookmark" do
    assert_difference('Bookmark.count', -1) do
      delete bookmark_url(@bookmark)
    end

    assert_redirected_to poi_url(@bookmark.poi)
  end
end
