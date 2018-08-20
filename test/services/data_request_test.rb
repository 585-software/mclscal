require 'test_helper'
require 'net/http'

class DataRequestTest < ActiveSupport::TestCase
  setup do
  end

  test "make request" do
    DataRequest.call
  end
end
