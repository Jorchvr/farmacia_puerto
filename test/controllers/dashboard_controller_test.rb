require "test_helper"

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dashboard_index_url
    assert_response :success
  end

  test "should get ventas" do
    get dashboard_ventas_url
    assert_response :success
  end

  test "should get stock" do
    get dashboard_stock_url
    assert_response :success
  end

  test "should get mas_vendidos" do
    get dashboard_mas_vendidos_url
    assert_response :success
  end
end
