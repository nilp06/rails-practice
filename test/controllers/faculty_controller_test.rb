require "test_helper"

class FacultyControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get faculty_new_url
    assert_response :success
  end

  test "should get show" do
    get faculty_show_url
    assert_response :success
  end

  test "should get index" do
    get faculty_index_url
    assert_response :success
  end

  test "should get edit" do
    get faculty_edit_url
    assert_response :success
  end
end
