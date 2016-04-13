require 'minitest/autorun'
require 'minitest/pride'
require './lib/responder'

class ResponderTest < Minintest::Test
  def test_it_can_send_response
    skip
    server = Server.new
    assert_equal "http/1.1 200 ok \n
    date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')} \n
    server: ruby \n
    content-type: text/html; charset=iso-8859-1 \n
    content-length: 123 \n

    Hello World (0)", server.respond
  end

  def test_it_can_format_first_request_line
    assert_equal 12,
    # assert_equal { "Verb" => "GET", "Path" => "/", "Protocol" => "HTTP/1.1"},
    server.format_first_request_line
  end

end
