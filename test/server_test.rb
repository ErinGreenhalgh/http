require 'minitest/autorun'
require 'minitest/pride'
require './lib/server'
require 'pry'

class ServerTest < Minitest::Test

  def setup
    server = Server.new
  end

  def test_it_can_listen_to_a_specific_port
    server = Server.new
    assert_equal 9292, server.port
  end

end
