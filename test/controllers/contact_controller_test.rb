require 'test_helper'

class ContactControllerTest < ActionDispatch::IntegrationTest
  test "should get contact" do
    get contact_url
    assert_response :success

    assert_template layout: 'application'

    assert_select 'title', 'Contact'
    assert_select 'h1', 'Contact'
  end

end
