require "cuba/test"
require "rack/test"
require "./log_drain"

require "byebug"

scope do
  test "Return an empty response" do
    post "/logs"

    assert_equal "", last_response.body
  end

  test "Accept a request that passed authentication" do
    basic_authorize ENV['LOGDRAIN_USERNAME'], ENV['LOGDRAIN_PASSWORD']
    post "/logs"
    assert_equal "noot noot", last_response.body
  end

  test "Drop a request that failed authentication" do
    basic_authorize "wrong"+ENV['LOGDRAIN_USERNAME'], "wrong"+ENV['LOGDRAIN_PASSWORD']
    post "/logs"
    assert_equal "", last_response.body
  end
end
