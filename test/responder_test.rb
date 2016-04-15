require 'minitest/autorun'
require 'minitest/pride'
require './lib/responder'
require 'pry'

module NullClient
  def self.puts(args)
  end
end

class ResponderTest < Minitest::Test
  attr_reader :responder
  def setup
    @responder = Responder.new
  end

  def test_it_can_format_the_response
    message = "Hello World (0)"

    expected = "<html><head></head><body><pre>#{message}\n</pre>" +
    "</body></html>"
    actual = responder.format_response(message)

    assert_equal expected, actual
  end

  def test_it_can_give_the_headers
    expected = ["http/1.1 200 ok",
    "date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}",
    "server: ruby",
    "content-type: text/html; charset=iso-8859-1",
    "content-length: 5\r\n\r\n"].join("\r\n")
    actual = responder.headers("reply")
    assert_equal expected, actual
  end

  def test_it_can_give_response
     expected_header = ["http/1.1 200 ok",
    "date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}",
    "server: ruby",
    "content-type: text/html; charset=iso-8859-1",
    "content-length: 66\r\n\r\n"].join("\r\n")
    message = "Hello World (0)"

    expected_reply = "<html><head></head><body><pre>#{message}\n</pre>" +
    "</body></html>"

    actual_header, actual_reply = responder.give_response(NullClient, message)
    assert_equal expected_header, actual_header
    assert_equal expected_reply, actual_reply
  end

end
