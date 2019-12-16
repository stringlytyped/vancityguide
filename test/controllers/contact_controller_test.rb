require 'test_helper'

class ContactControllerTest < ActionDispatch::IntegrationTest
  test "should get contact" do
    get contact_url
    assert_response :success

    assert_select 'title', 'Contact'
    assert_select 'h1', 'Contact'
    assert_select '.field', 3
    assert_select 'input#sender_name'
    assert_select 'input#sender_addr'
    assert_select 'textarea#message'
    assert_select 'input[type=submit]'
  end

end
