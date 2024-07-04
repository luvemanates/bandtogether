require "test_helper"

class ProblemEntryTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "Can create a model" do
    nuser = User.create(:email => 'exampleuser@example.com',
                        :password => 'sweety1234',
                        :password_confirmation => 'sweet1234')
    pe = ProblemEntry.new(:title => "War in Gaza", 
                          :description => "There has been a war going on months now, and it is a humanitarian disaster.", 
                          :creator => nuser,
                          :website_url => "example.com/blog" ) 
    assert_difference "ProblemEntry.count" do
      assert pe.save
    end
  end
end
