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
    assert_difference 'User.count', 1 do
      u = User.create({:email => 'user@user.com', :password => 'sweety1234', :password_confirmation => 'sweety1234' })
    end
    post user_session_path, :params => { :user => { :email => 'user@user.com', :password => 'sweety1234' } }
    assert_redirected_to root_path

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
    pe = nil
    nuser = nil
    assert_difference 'User.count', 1 do
      nuser = User.create(:email => 'exampleuser@example.com',
                          :password => 'sweety1234',
                          :password_confirmation => 'sweety1234')
    end
    assert_difference 'ProblemEntry.count', 1 do
      pe = ProblemEntry.create(:title => "War in Gaza", 
                               :description => "There has been a war going on months now, and it is a humanitarian disaster.", 
                               :creator => nuser,
                               :website_url => "example.com/blog" ) 
    end
    post user_session_path, :params => { :user => { :email => 'exampleuser@example.com', :password => 'sweety1234'} }
    assert_redirected_to root_path
    patch problem_entry_url(pe), params: { problem_entry: { creator_id: pe.creator_id, description: pe.description, title: pe.title, website_url: pe.website_url } }
    assert_redirected_to problem_entry_url(pe)
  end

  test "should destroy problem_entry" do
    pe = nil
    nuser = nil
    assert_difference 'User.count', 1 do
      nuser = User.create(:email => 'exampleuser@example.com',
                          :password => 'sweety1234',
                          :password_confirmation => 'sweety1234')
    end
    assert_difference 'ProblemEntry.count', 1 do
      pe = ProblemEntry.create(:title => "War in Gaza", 
                               :description => "There has been a war going on months now, and it is a humanitarian disaster.", 
                               :creator => nuser,
                               :website_url => "example.com/blog" ) 
    end
    post user_session_path, :params => { :user => { :email => 'exampleuser@example.com', :password => 'sweety1234'} }
    assert_redirected_to root_path
    assert_difference("ProblemEntry.count", -1) do
      delete problem_entry_url(pe)
    end

    assert_redirected_to problem_entries_url
  end
end
