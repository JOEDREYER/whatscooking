require "test_helper"

class ScrapeLogsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get scrape_logs_index_url
    assert_response :success
  end

  test "should get show" do
    get scrape_logs_show_url
    assert_response :success
  end

  test "should get new" do
    get scrape_logs_new_url
    assert_response :success
  end

  test "should get create" do
    get scrape_logs_create_url
    assert_response :success
  end

  test "should get edit" do
    get scrape_logs_edit_url
    assert_response :success
  end

  test "should get update" do
    get scrape_logs_update_url
    assert_response :success
  end

  test "should get destroy" do
    get scrape_logs_destroy_url
    assert_response :success
  end
end
