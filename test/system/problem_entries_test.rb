require "application_system_test_case"

class ProblemEntriesTest < ApplicationSystemTestCase
  setup do
    @problem_entry = problem_entries(:one)
  end

  test "visiting the index" do
    visit problem_entries_url
    assert_selector "h1", text: "Problem entries"
  end

  test "should create problem entry" do
    visit problem_entries_url
    click_on "New problem entry"

    fill_in "Creator", with: @problem_entry.creator_id
    fill_in "Description", with: @problem_entry.description
    fill_in "Title", with: @problem_entry.title
    fill_in "Website url", with: @problem_entry.website_url
    click_on "Create Problem entry"

    assert_text "Problem entry was successfully created"
    click_on "Back"
  end

  test "should update Problem entry" do
    visit problem_entry_url(@problem_entry)
    click_on "Edit this problem entry", match: :first

    fill_in "Creator", with: @problem_entry.creator_id
    fill_in "Description", with: @problem_entry.description
    fill_in "Title", with: @problem_entry.title
    fill_in "Website url", with: @problem_entry.website_url
    click_on "Update Problem entry"

    assert_text "Problem entry was successfully updated"
    click_on "Back"
  end

  test "should destroy Problem entry" do
    visit problem_entry_url(@problem_entry)
    click_on "Destroy this problem entry", match: :first

    assert_text "Problem entry was successfully destroyed"
  end
end
