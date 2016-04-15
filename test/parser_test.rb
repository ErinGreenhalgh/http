require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require './lib/parser'
require 'pry'

class ParserTest < Minitest::Test

  def test_it_can_create_a_hash_from_request_lines
    parser = Parser.new
    lines = {"Host"=>"127.0.0.1:9292",
 "Connection"=>"keep-alive",
 "Cache-Control"=>"max-age=0",
 "Accept"=>"text/html",
 "Upgrade-Insecure-Requests"=>"1",
 "User-Agent"=>"Mozilla/5.0",
 "Accept-Encoding"=>"gzip, deflate, sdch",
 "Accept-Language"=>"en-US,en;q=0.8"}
    parser.parse_response(sample_lines)
    assert_equal lines, parser.convert_lines_to_hash
  end

  def test_it_can_get_the_verb
    parser = Parser.new
    parser.parse_response(sample_lines)
    assert_equal "GET", parser.get_verb
  end

  def test_it_can_get_the_path
    parser = Parser.new
    parser.parse_response(sample_lines)
    assert_equal "/", parser.get_path
  end

  def test_it_can_get_the_protocol
    parser = Parser.new
    parser.parse_response(sample_lines)
    assert_equal "HTTP/1.1", parser.get_protocol
  end

  def test_it_can_get_the_host
    parser = Parser.new
    parser.parse_response(sample_lines)
    assert_equal "127.0.0.1", parser.get_host
  end

  def test_it_can_get_the_port
    parser = Parser.new
    parser.parse_response(sample_lines)
    assert_equal "9292", parser.get_port
  end

  def test_it_can_get_the_origin
    parser = Parser.new
    parser.parse_response(sample_lines)
    assert_equal "127.0.0.1", parser.get_origin
  end

  def test_it_can_get_the_accept_data
    parser = Parser.new
    parser.parse_response(sample_lines)
    assert_equal "text/html", parser.get_accept
  end

  def test_it_can_parse_the_response
    parser = Parser.new
    assert_equal "Verb: GET
Path: /
Protocol: HTTP/1.1
Host: 127.0.0.1
Port: 9292
Origin: 127.0.0.1
Accept: text/html", parser.parse_response(sample_lines)
  end

  def test_it_can_say_hello
    parser = Parser.new
    parser.parse_response(sample_lines)
    assert_equal "Hello World 1", parser.hello_response
  end

  def test_it_can_provide_date_time

    parser = Parser.new
    parser.parse_response(sample_lines)
    assert_equal Time.now.strftime('%a, %e %b %Y %H:%M:%S %z'), parser.date_time_response
  end

  def test_it_cannot_find_word
    parser = Parser.new
    parser.parse_response(sample_lines_word_not_valid)
    assert_equal "WORD is not a known word", parser.word_search_response
  end

  def test_it_cannot_find_word
    parser = Parser.new
    parser.parse_response(sample_lines_word)
    assert_equal "WORD is a known word", parser.word_search_response
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

  def sample_lines_word
    ["GET /word_search?word=hello HTTP/1.1",
   "Host: 127.0.0.1:9292",
   "Connection: keep-alive",
   "Cache-Control: max-age=0",
   "Accept: text/html",
   "Upgrade-Insecure-Requests: 1",
   "User-Agent: Mozilla/5.0",
   "Accept-Encoding: gzip, deflate, sdch",
   "Accept-Language: en-US,en;q=0.8"]
  end

  def sample_lines_word_not_valid
    ["GET /word_search?word=heeellllloooo HTTP/1.1",
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
