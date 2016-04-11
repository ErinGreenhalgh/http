require 'minitest/autorun'
require 'minitest/pride'
require './lib/server'

class ServerTest < Minitest::Test

  def test_it_can_listen_to_a_specific_port
    server = Server.new
    assert_equal 9292, server.port
  end

  # def test_it_can_recognize_when_a_message_is_meant_for_it
  #   server = Server.new
  #   #when it sees its IP address,
  #   #it accepts the message
  # end

  def test_it_can_receive_a_request
    skip
    server = Server.new


  end






end
