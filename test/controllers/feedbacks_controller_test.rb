require 'test_helper'

class FeedbacksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
