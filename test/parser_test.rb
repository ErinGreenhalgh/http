require 'minitest/autorun'
require 'minitest/pride'
require './lib/parser'

class ParserTest < Minitest::Test

  #edge case: request lines = nil
  def test_it_can_create_a_hash_from_request_lines
    parser = Parser.new(sample_lines)
    lines = {"Host"=>"127.0.0.1:9292",
 "Connection"=>"keep-alive",
 "Cache-Control"=>"max-age=0",
 "Accept"=>"text/html",
 "Upgrade-Insecure-Requests"=>"1",
 "User-Agent"=>"Mozilla/5.0",
 "Accept-Encoding"=>"gzip, deflate, sdch",
 "Accept-Language"=>"en-US,en;q=0.8"}
    assert_equal lines, parser.get_hash_of_request_lines
  end

  def test_it_can_get_the_verb
    parser = Parser.new(sample_lines)
    assert_equal "GET", parser.get_verb
  end

  def test_it_can_get_the_path
    parser = Parser.new(sample_lines)
    assert_equal "/", parser.get_path
  end

  def test_it_can_get_the_protocol
    parser = Parser.new(sample_lines)
    assert_equal "HTTP/1.1", parser.get_protocol
  end

  def test_it_can_get_the_host
    parser = Parser.new(sample_lines)
    assert_equal "127.0.0.1", parser.get_host
  end

  def test_it_can_get_the_port
    parser = Parser.new(sample_lines)
    assert_equal "9292", parser.get_port
  end

  def test_it_can_get_the_origin
    parser = Parser.new(sample_lines)
    assert_equal "127.0.0.1", parser.get_origin
  end

  def test_it_can_get_the_accept_data
    parser = Parser.new(sample_lines)
    assert_equal "text/html", parser.get_accept
  end

  def test_it_can_parse_the_response
    parser = Parser.new(sample_lines)
    assert_equal "Verb: GET
      Path: /
      Protocol: HTTP/1.1
      Host: 127.0.0.1
      Port: 9292
      Origin: 127.0.0.1
      Accept: text/html", parser.parse_response
  end

  def sample_lines
    ["GET / HTTP/1.1",
   "Host: 127.0.0.1:9292",
   "Connection: keep-alive",
   "Cache-Control: max-age=0",
   "Accept: text/html",
   "Upgrade-Insecure-Requests: 1",
   "User-Agent: Mozilla/5.0",
   "Accept-Encoding: gzip, deflate, sdch",
   "Accept-Language: en-US,en;q=0.8"]
  end
end
