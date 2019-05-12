require "rack/test"
require "./log_drain"

describe Cuba do
  include Rack::Test::Methods

  context "post to /logs" do
    let(:app) { Cuba.new }

    it "tests" do
      require 'byebug'
      byebug
      expect(response.status).to eq 200
    end
  end
end
