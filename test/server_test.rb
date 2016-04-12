require 'minitest/autorun'
require 'minitest/pride'
require './lib/server'
require 'pry'

class ServerTest < Minitest::Test

  def test_it_can_listen_to_a_specific_port
    server = Server.new
    assert_equal 9292, server.port
  end

  def test_it_can_receive_a_request
    server = Server.new
    assert nil, server.receive_request #it received it
    #if the request_lines array has something in it,
    #it has received a request
  end

  def test_it_can_send_response
    server = Server.new
    assert_equal "http/1.1 200 ok \n
    date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')} \n
    server: ruby \n
    content-type: text/html; charset=iso-8859-1 \n
    content-length: 123 \n

    Hello World (0)", server.respond
  end

end
