require 'test_helper'

class PoisControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @poi = pois(:one)
    sign_in users(:admin)
  end

  test "should get index" do
    get pois_url
    assert_response :success

    assert_select 'title', 'My attractions'
    assert_select 'h1', 'My attractions'
    assert_select 'a', "New attraction"
    # One POI should be displayed because users(:admin) has one POI associated
    assert_select "article.poi-tile"
    # The following section should be shown because we are logged in as admin
    assert_select 'h2', 'Attractions created by other users'
    assert_select 'td:first-child', 'MyString'
    assert_select 'td:nth-child(2)', 'Nature'
    assert_select 'a', "Show"
    assert_select 'a', "Edit"
    assert_select 'a', "Destroy"
  end

  test "should get new" do
    get new_poi_url
    assert_response :success

    assert_select 'title', 'New attraction'
    assert_select 'h1', 'New attraction'

    assert_select 'label', 'Category'
    assert_select 'select#poi_category'
    assert_select 'label', 'Name'
    assert_select 'input#poi_name'
    assert_select 'label', 'Latitude'
    assert_select 'input#poi_lat'
    assert_select 'label', 'Longitude'
    assert_select 'input#poi_lon'
    assert_select 'label', 'Website'
    assert_select 'input#poi_website'
    assert_select 'label', 'Price'
    assert_select 'input#poi_price'
    assert_select 'label', 'Description'
    assert_select 'textarea#poi_description'
    assert_select 'label', 'Rating'
    assert_select 'input#poi_rating'
    assert_select 'label', 'Public'
    assert_select 'input#poi_public'
    # Featured checkbox should be present because we are logged in as admin
    assert_select 'label', 'Featured'
    assert_select 'input#poi_featured'

    assert_select 'input[type=submit]'
    assert_select 'a', 'Cancel'
  end

  test "should create poi" do
    assert_difference('Poi.count') do
      post pois_url, params: { poi: { category: @poi.category, description: @poi.description, featured: @poi.featured, name: @poi.name, price: @poi.price, public: @poi.public, rating: @poi.rating, owner_id: @poi.owner_id, website: @poi.website, lat: @poi.lat, lon: @poi.lon } }
    end

    assert_redirected_to poi_url(Poi.last)
  end

  test "should show poi" do
    get poi_url(@poi)
    assert_response :success

    assert_select '.poi-header_category', 'Nature'
    assert_select '.poi-header_name', 'MyString'
    assert_select 'p', '★'                   # Rating
    assert_select 'dd a', 'google.com'       # Website
    assert_select 'dd', 'MyString'           # Price
    assert_select 'p:nth-child(5)', 'MyText' # Description
    # Admin controls:
    assert_select 'hr + dl dd:nth-child(2)', 'test-admin@example.com'
    assert_select 'hr + dl dd:nth-child(4)', 'true' # Public
    assert_select 'hr + dl dd:nth-child(6)', 'true' # Featured
  end

  test "should get edit" do
    get edit_poi_url(@poi)
    assert_response :success

    assert_select 'title', 'Edit attraction'
    assert_select 'h1', 'Edit attraction'

    assert_select 'label', 'Category'
    assert_select 'select#poi_category'
    assert_select 'label', 'Name'
    assert_select 'input#poi_name'
    assert_select 'label', 'Latitude'
    assert_select 'input#poi_lat'
    assert_select 'label', 'Longitude'
    assert_select 'input#poi_lon'
    assert_select 'label', 'Website'
    assert_select 'input#poi_website'
    assert_select 'label', 'Price'
    assert_select 'input#poi_price'
    assert_select 'label', 'Description'
    assert_select 'textarea#poi_description'
    assert_select 'label', 'Rating'
    assert_select 'input#poi_rating'
    assert_select 'label', 'Public'
    assert_select 'input#poi_public'
    # Featured checkbox should be present because we are logged in as admin
    assert_select 'label', 'Featured'
    assert_select 'input#poi_featured'

    assert_select 'input[type=submit]'
    assert_select 'a', 'Cancel'
  end

  test "should update poi" do
    patch poi_url(@poi), params: { poi: { category: @poi.category, description: @poi.description, featured: @poi.featured, name: @poi.name, price: @poi.price, public: @poi.public, rating: @poi.rating, owner_id: @poi.owner_id, website: @poi.website } }
    assert_redirected_to poi_url(@poi)
  end

  test "should destroy poi" do
    assert_difference('Poi.count', -1) do
      delete poi_url(@poi)
    end

    assert_redirected_to pois_url
  end
end
