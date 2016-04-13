require 'minitest/autorun'
require 'minitest/pride'
require './lib/responder'

class ResponderTest < Minitest::Test

  def setup
    responder = Responder.new
  end

  def test_it_can_format_the_response
    responder = Responder.new
    assert_equal "<html><head></head><body><pre>Hello World (0)\n</pre>" +
    "</body></html>",
    responder.format_response
  end

  def test_it_can_give_the_headers
    skip
    assert_equal "http/1.1 200 ok\r
    date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}\r
    server: ruby\r
    content-type: text/html; charset=iso-8859-1\r
    content-length: 66\r\n\r", responder.headers
  end

  def test_it_can_give_response
    skip
    assert_equal "http/1.1 200 ok
    date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}
    server: ruby
    content-type: text/html; charset=iso-8859-1
    content-length: 123

    Hello World (0)", responder.respond
  end

  def test_it_can_format_first_request_line
    responder = Responder.new
    assert_equal 12,
    # assert_equal { "Verb" => "GET", "Path" => "/", "Protocol" => "HTTP/1.1"},
    responder.format_first_request_line(request_lines)
  end

end
