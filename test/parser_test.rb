require 'minitest/autorun'
require 'minitest/pride'
require './lib/parser'
require 'pry'

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

    assert_equal lines, parser.convert_lines_to_hash
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
end
