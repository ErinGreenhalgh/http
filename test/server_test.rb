require 'minitest/autorun'
require 'minitest/pride'
require './lib/server'

class ServerTest < Minitest::Test

  def test_it_can_listen_to_a_specific_port
    server = Server.new
    assert_equal 9292, server.port
  end

  def test_it_can_create_a_new_client
    server = Server.new
    # assert_equal  ,
  end

  def test_it_can_receive_a_request
    skip
    server = Server.new
  end

end
