require "test_helper"

class ProblemEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @problem_entry = problem_entries(:one)
  end

  test "should get index" do
    get problem_entries_url
    assert_response :success
  end

  test "should get new" do
    get new_problem_entry_url
    assert_response :success
  end

  test "should create problem_entry" do
    assert_difference("ProblemEntry.count") do
      post problem_entries_url, params: { problem_entry: { creator_id: @problem_entry.creator_id, description: @problem_entry.description, title: @problem_entry.title, website_url: @problem_entry.website_url } }
    end

    assert_redirected_to problem_entry_url(ProblemEntry.last)
  end

  test "should show problem_entry" do
    get problem_entry_url(@problem_entry)
    assert_response :success
  end

  test "should get edit" do
    get edit_problem_entry_url(@problem_entry)
    assert_response :success
  end

  test "should update problem_entry" do
    patch problem_entry_url(@problem_entry), params: { problem_entry: { creator_id: @problem_entry.creator_id, description: @problem_entry.description, title: @problem_entry.title, website_url: @problem_entry.website_url } }
    assert_redirected_to problem_entry_url(@problem_entry)
  end

  test "should destroy problem_entry" do
    assert_difference("ProblemEntry.count", -1) do
      delete problem_entry_url(@problem_entry)
    end

    assert_redirected_to problem_entries_url
  end
end
