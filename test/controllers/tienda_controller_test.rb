require "test_helper"

class TiendaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tienda_index_url
    assert_response :success
  end

  test "should get show" do
    get tienda_show_url
    assert_response :success
  end
end
