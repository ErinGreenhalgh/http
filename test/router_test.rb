require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/router'

class RouterTest < Minitest::Test

  def test_it_can_rout_to_root_response
    skip
    parser = Parser.new
    assert_equal "Verb: GET
Path: /
Protocol: HTTP/1.1
Host: 127.0.0.1
Port: 9292
Origin: 127.0.0.1
Accept: text/html", parser.parse_response(sample_lines)
  end

  def test_it_can_rout_to_hello_path

  end

  def test_it_can_rout_to_datetime_path

  end

  def test_it_can_rout_to_shutdown

  end

  
end
