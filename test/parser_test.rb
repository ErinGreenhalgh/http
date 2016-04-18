require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require './lib/parser'
require 'pry'

class ParserTest < Minitest::Test
  def setup
    @parser= Parser.new(sample_lines)
  end

  def test_it_can_create_a_hash_from_request_lines
    lines = {"Host"=>"127.0.0.1:9292",
 "Connection"=>"keep-alive",
 "Cache-Control"=>"max-age=0",
 "Accept"=>"text/html",
 "Upgrade-Insecure-Requests"=>"1",
 "User-Agent"=>"Mozilla/5.0",
 "Accept-Encoding"=>"gzip, deflate, sdch",
 "Accept-Language"=>"en-US,en;q=0.8"}
    assert_equal lines, @parser.create_hash
  end

  def test_it_can_parse_the_first_line
    assert_equal "GET", @parser.parse_first_line["Verb"]
    assert_equal "/", @parser.parse_first_line["Path"]
    assert_equal "HTTP/1.1", @parser.parse_first_line["Protocol"]

  end

  def test_it_can_get_the_verb
    assert_equal "GET", @parser.get_verb
  end

  def test_it_can_get_the_path
    assert_equal "/", @parser.get_path
  end

  def test_it_can_get_the_protocol
    assert_equal "HTTP/1.1", @parser.get_protocol
  end

  def test_it_can_get_the_host
    assert_equal "127.0.0.1", @parser.get_host
  end

  def test_it_can_get_the_port
    assert_equal "9292", @parser.get_port
  end

  def test_it_can_get_the_origin
    assert_equal "127.0.0.1", @parser.get_origin
  end

  def test_it_can_get_the_accept_data
    assert_equal "text/html", @parser.get_accept
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
