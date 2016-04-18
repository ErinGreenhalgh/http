require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/router'

class RouterTest < Minitest::Test
  def setup
    @router = Router.new
  end

  def test_it_can_rout_to_root_response
    assert_equal "Verb: GET
Path: /
Protocol: HTTP/1.1
Host: 127.0.0.1
Port: 9292
Origin: 127.0.0.1
Accept: text/html", @router.root_response
  end

  def test_it_can_rout_to_hello_path
    skip
  end

  def test_it_can_rout_to_datetime_path
    skip
  end

  def test_it_can_rout_to_shutdown
    skip
  end


end
