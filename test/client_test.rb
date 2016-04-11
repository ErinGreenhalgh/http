require 'minitest/autorun'
require 'minitest/pride'
require './lib/client'

class ClientTest < Minitest::Test

  def test_it_recieve_a_request
    client = Client.new
    assert_equal ["Hello"], client.get_input
  end

  def test_it_can_confirm_request
    client = Client.new
    assert_equal ["Hello"], client.confirm_request
  end

  def test_it_can_send_a_response
    skip

  end

end
