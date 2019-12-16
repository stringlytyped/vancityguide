require 'test_helper'

class PoiTest < ActiveSupport::TestCase
  fixtures :pois

  setup do
    # Initialize valid POI
    @poi = Poi.new
    @poi.name = pois(:one).name
    @poi.owner = pois(:one).owner
    @poi.category = pois(:one).category
  end

  test "required POI attributes should not be empty" do
    poi = Poi.new
    assert poi.invalid?
    assert poi.errors[:name].any?
    assert poi.errors[:owner].any?
    assert poi.errors[:category].any?
  end

  test "POI website attribute should be a valid URL" do
    @poi.website = "google"
    assert @poi.invalid?
    assert @poi.errors[:website].any?
    @poi.website = "https://google.com"
    assert @poi.valid?
    assert_not @poi.errors[:website].any?
  end

  test "POI rating attribute should be between 1 and 5" do
    @poi.rating = 0
    assert @poi.invalid?
    assert @poi.errors[:rating].any?
    @poi.rating = 6
    assert @poi.invalid?
    assert @poi.errors[:rating].any?
    @poi.rating = 3
    assert @poi.valid?
    assert_not @poi.errors[:rating].any?
  end

  test "POI lat attribute should be between -90 and 90" do
    @poi.lat = -91
    assert @poi.invalid?
    assert @poi.errors[:lat].any?
    @poi.lat = 91
    assert @poi.invalid?
    assert @poi.errors[:lat].any?
    @poi.lat = 50
    assert @poi.valid?
    assert_not @poi.errors[:lat].any?
  end

  test "POI lon attribute should be between -180 and 180" do
    @poi.lat = -181
    assert @poi.invalid?
    assert @poi.errors[:lat].any?
    @poi.lat = 181
    assert @poi.invalid?
    assert @poi.errors[:lat].any?
    @poi.lat = 50
    assert @poi.valid?
    assert_not @poi.errors[:lat].any?
  end
end
