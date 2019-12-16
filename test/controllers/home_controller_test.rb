require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_url
    assert_response :success

    assert_select 'title', 'Vancity Guide'
    assert_select ".home-header_logo"
    assert_select ".home-header_tagline"
    # This heading should be visible because pois(:one) has :featured set to true
    assert_select "h2", "Featured attractions"
    # This heading should be visible because pois(:two) has :public set to true and :featured set to false
    assert_select "h2", "Attractions contributed by our users"
    # Two POI should be displayed
    assert_select "article.poi-tile", 2
  end
end
